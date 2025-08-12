const service = require('../services/order_produk.service')
const { buildCrudController } = require('../utils/crud.controller')

module.exports = buildCrudController({
  service,
  pkFields: ['no_invoice'],
  resourceName: 'order_produk'
})