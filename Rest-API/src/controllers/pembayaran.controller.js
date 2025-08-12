const service = require('../services/pembayaran.service')
const { buildCrudController } = require('../utils/crud.controller')

module.exports = buildCrudController({
  service,
  pkFields: ['id_pembayaran'],
  resourceName: 'pembayaran'
})