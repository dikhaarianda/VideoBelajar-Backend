'use strict';

const express = require('express');
const router = express.Router();
const upload = require('../middleware/upload');
const { upload: uploadController } = require('../controllers/uploadController');

router.post('/upload', upload, uploadController);
module.exports = router;