const service = require('../services/tutor.service')
const { buildCrudController } = require('../utils/crud.controller')

module.exports = buildCrudController({
  service,
  pkFields: ['id_tutor'],
  resourceName: 'tutor'
})