const service = require('../services/kategori.service')
const { buildCrudController } = require('../utils/crud.controller')

module.exports = buildCrudController({
  service,
  pkFields: ['id_kategori'],
  resourceName: 'kategori'
})