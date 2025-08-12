const service = require('../services/modul.service')
const { buildCrudController } = require('../utils/crud.controller')

module.exports = buildCrudController({
  service,
  pkFields: ['id_modul'],
  resourceName: 'modul'
})