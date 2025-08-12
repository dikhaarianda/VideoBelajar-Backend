const service = require('../services/bahasa_pengantar.service')
const { buildCrudController } = require('../utils/crud.controller')

module.exports = buildCrudController({
  service,
  pkFields: ['modul', 'bahasa'],
  resourceName: 'bahasa_pengantar'
})