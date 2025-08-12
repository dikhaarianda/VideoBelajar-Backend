const service = require('../services/produk.service')
const { buildCrudController } = require('../utils/crud.controller')

module.exports = buildCrudController({
  service,
  pkFields: ['id_produk'],
  resourceName: 'produk'
})