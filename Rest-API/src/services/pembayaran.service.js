const { buildService } = require('../utils/base.service')
const pembayaranService = buildService('pembayaran', ['id_pembayaran'])

module.exports = pembayaranService