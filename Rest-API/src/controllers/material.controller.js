const service = require('../services/material.service')
const { buildCrudController } = require('../utils/crud.controller')

module.exports = buildCrudController({
  service,
  pkFields: ['id_material'],
  resourceName: 'material'
})