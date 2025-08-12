const { buildService } = require('../utils/base.service')
const reviewProdukService = buildService('review_produk', ['siswa', 'produk'])

module.exports = reviewProdukService