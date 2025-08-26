'use strict';

const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { v4: uuidv4 } = require('uuid');
const { Op } = require('sequelize');
const { User } = require('../models');
const { sendVerificationEmail } = require('../services/emailService');

async function register(req, res, next) {
  try {
    const { fullname, username, email, password } = req.body;
    if (!fullname || !username || !email || !password) {
      return res.status(400).json({
        success: false,
        message: 'fullname, username, email, and password are required',
      });
    }

    const existing = await User.findOne({
      where: {
        [Op.or]: [{ email }, { username }]
      }
    });

    if (existing) {
      return res.status(400).json({
        success: false,
        message: 'Email or username already in use',
      });
    }

    const saltRounds = 10;
    const hashedPassword = await bcrypt.hash(password, saltRounds);
    const verificationToken = uuidv4();
    const newUser = await User.create({
      fullname,
      username,
      email,
      password: hashedPassword,
      verification_token: verificationToken,
    });
    console.log('New user registered:', { id: newUser.id, email: newUser.email });

    let emailSent = true;
    try {
      await sendVerificationEmail(email, verificationToken);
    } catch (mailErr) {
      emailSent = false;
      console.error('Error sending verification email:', mailErr.message);
    }

    return res.status(201).json({
      success: true,
      message: emailSent
        ? 'User registered successfully. Verification email sent.'
        : 'User registered successfully. Failed to send verification email.',
      data: {
        id: newUser.id,
        email: newUser.email,
        username: newUser.username,
        fullname: newUser.fullname,
        emailSent
      }
    });
  } catch (err) {
    console.error('Register error:', err);
    return next(err);
  }
}

async function login(req, res, next) {
  try {
    const { email, password } = req.body;
    if (!email || !password) {
      return res.status(400).json({
        success: false,
        message: 'email and password are required',
      });
    }

    const user = await User.findOne({ where: { email } });
    if (!user) {
      return res.status(401).json({
        success: false,
        message: 'Invalid email or password',
      });
    }

    const match = await bcrypt.compare(password, user.password);
    if (!match) {
      return res.status(401).json({
        success: false,
        message: 'Invalid email or password',
      });
    }

    const payload = {
      id: user.id,
      email: user.email,
      username: user.username
    };
    const token = jwt.sign(payload, process.env.JWT_SECRET, { expiresIn: '7d' });
    return res.status(200).json({
      success: true,
      message: 'Login successful',
      token
    });
  } catch (err) {
    console.error('Login error:', err);
    return next(err);
  }
}

async function verifyEmail(req, res, next) {
  try {
    const token = req.query.token;
    if (!token) {
      return res.status(400).json({
        success: false,
        message: 'Verification token is required',
      });
    }

    const user = await User.findOne({ where: { verification_token: token } });
    if (!user) {
      return res.status(400).json({
        success: false,
        message: 'Invalid Verification Token',
      });
    }

    user.verification_token = null;
    await user.save();
    return res.status(200).json({
      success: true,
      message: 'Email Verified Successfully'
    });
  } catch (err) {
    console.error('Verify email error:', err);
    return next(err);
  }
}

module.exports = {
  register,
  login,
  verifyEmail
};