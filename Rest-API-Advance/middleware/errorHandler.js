'use strict';

module.exports = function errorHandler(err, req, res, next) {
  const status = err.status || err.statusCode || 500;

  console.error('Error handler caught:', {
    message: err.message,
    status,
    stack: err.stack,
    errors: err.errors || undefined
  });

  return res.status(status).json({
    success: false,
    message: err.message || 'Internal Server Error',
    errors: err.errors || undefined
  });
};