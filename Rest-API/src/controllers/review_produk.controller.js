const service = require('../services/review_produk.service')
const { buildCrudController } = require('../utils/crud.controller')

module.exports = buildCrudController({
  service,
  pkFields: ['siswa', 'produk'],
  resourceName: 'review_produk'
})