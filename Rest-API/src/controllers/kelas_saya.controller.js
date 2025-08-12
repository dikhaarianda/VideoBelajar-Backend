const service = require('../services/kelas_saya.service')
const { buildCrudController } = require('../utils/crud.controller')

module.exports = buildCrudController({
  service,
  pkFields: ['id_kelas_saya'],
  resourceName: 'kelas_saya'
})