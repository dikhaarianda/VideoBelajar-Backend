function ok(res, data, message = 'Success') {
  return res.json({ success: true, data, message })
}
function err(res, message = 'Server error, please try again...', code = 500) {
  return res.status(code).json({ success: false, message })
}

module.exports = { ok, err }