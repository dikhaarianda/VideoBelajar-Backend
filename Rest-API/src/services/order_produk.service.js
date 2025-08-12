const { buildService } = require('../utils/base.service')
const orderProdukService = buildService('order_produk', ['no_invoice'])

module.exports = orderProdukService