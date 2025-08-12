const { buildService } = require('../utils/base.service')
const produkService = buildService('produk', ['id_produk'])

module.exports = produkService