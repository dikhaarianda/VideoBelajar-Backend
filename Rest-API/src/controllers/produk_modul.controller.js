const service = require('../services/produk_modul.service')
const { buildCrudController } = require('../utils/crud.controller')

module.exports = buildCrudController({
  service,
  pkFields: ['produk', 'modul'],
  resourceName: 'produk_modul'
})