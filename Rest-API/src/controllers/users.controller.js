const service = require('../services/users.service')
const { buildCrudController } = require('../utils/crud.controller')

module.exports = buildCrudController({
  service,
  pkFields: ['id_user'],
  resourceName: 'users'
})