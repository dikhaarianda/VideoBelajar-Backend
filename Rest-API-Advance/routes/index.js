'use strict';

const express = require('express');
const router = express.Router();
const authRoutes = require('./authRoutes');
const courseRoutes = require('./courseRoutes');
const uploadRoutes = require('./uploadRoutes');

router.use('/', authRoutes);
router.use('/', courseRoutes);
router.use('/', uploadRoutes);
router.get('/', (_, res) => {
  return res.status(200).json({
    success: true,
    message: 'EduCourse API is running'
  });
});

module.exports = router;