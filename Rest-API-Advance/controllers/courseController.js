'use strict';

const { Op } = require('sequelize');
const { Course } = require('../models');

async function getCourses(req, res, next) {
  try {
    const { topic, sortBy, search } = req.query;
    const where = {};

    if (topic) {
      where.topic = topic;
    }
    if (search) {
      where[Op.or] = [
        { title: { [Op.like]: `%${search}%` } },
        { description: { [Op.like]: `%${search}%` } }
      ];
    }

    const allowedSorts = new Set(['price', 'created_at', 'title']);
    let order;
    if (sortBy && allowedSorts.has(sortBy)) {
      order = [[sortBy, 'ASC']];
    } else {
      order = [['created_at', 'DESC']];
    }
    const courses = await Course.findAll({
      where,
      order
    });
    return res.status(200).json({
      success: true,
      message: 'Courses fetched successfully',
      count: courses.length,
      data: courses
    });
  } catch (err) {
    console.error('Get courses error:', err);
    return next(err);
  }
}

module.exports = {
  getCourses
};