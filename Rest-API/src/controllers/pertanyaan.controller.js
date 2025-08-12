const service = require('../services/pertanyaan.service')
const { buildCrudController } = require('../utils/crud.controller')

module.exports = buildCrudController({
  service,
  pkFields: ['id_pertanyaan'],
  resourceName: 'pertanyaan'
})