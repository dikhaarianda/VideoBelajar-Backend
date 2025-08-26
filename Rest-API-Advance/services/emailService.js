'use strict';

const nodemailer = require('nodemailer');
const transporter = nodemailer.createTransport({
  host: process.env.EMAIL_HOST,
  port: Number(process.env.EMAIL_PORT || 587),
  secure: false,
  auth: {
    user: process.env.EMAIL_USER,
    pass: process.env.EMAIL_PASSWORD,
  },
});

async function sendVerificationEmail(toEmail, token) {
  const baseUrl = process.env.APP_BASE_URL || `http://localhost:${process.env.PORT || 3000}`;
  const verificationLink = `${baseUrl}/verify-email?token=${encodeURIComponent(token)}`;

  const mailOptions = {
    from: `"EduCourse" <${process.env.EMAIL_USER}>`,
    to: toEmail,
    subject: 'Verify your EduCourse account',
    html: `
      <div style="font-family: Arial, sans-serif; color: #333;">
        <h2>Welcome to EduCourse!</h2>
        <p>Thanks for registering. Please verify your email address by clicking the button below:</p>
        <p>
          <a href="${verificationLink}" style="display: inline-block; background-color: #4CAF50; color: white; padding: 10px 16px; text-decoration: none; border-radius: 4px;">
            Verify Email
          </a>
        </p>
        <p>If the button doesn't work, copy and paste this URL in your browser:</p>
        <p><a href="${verificationLink}">${verificationLink}</a></p>
        <hr />
        <p>If you did not create an account, you can ignore this email.</p>
      </div>
    `,
  };

  const info = await transporter.sendMail(mailOptions);
  console.log('Verification email sent:', info.messageId);
  return info;
}

module.exports = {
  sendVerificationEmail,
};