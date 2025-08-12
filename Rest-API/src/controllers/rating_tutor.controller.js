const service = require('../services/rating_tutor.service')
const { buildCrudController } = require('../utils/crud.controller')

module.exports = buildCrudController({
  service,
  pkFields: ['siswa', 'tutor'],
  resourceName: 'rating_tutor'
})