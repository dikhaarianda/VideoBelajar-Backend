'use strict';

async function upload(req, res, next) {
  try {
    if (!req.file) {
      return res.status(400).json({
        success: false,
        message: 'No file uploaded. Ensure form-data key is .jpg/.jpeg/.png',
      });
    }

    const fileUrlPath = `/uploads/${req.file.filename}`;
    return res.status(201).json({
      success: true,
      message: 'File uploaded successfully',
      data: {
        filename: req.file.filename,
        mimetype: req.file.mimetype,
        size: req.file.size,
        path: fileUrlPath
      }
    });
  } catch (err) {
    console.error('Upload error:', err);
    return next(err);
  }
}

module.exports = {
  upload
};