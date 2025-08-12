const { buildService } = require('../utils/base.service')
const usersService = buildService('users', ['id_user'])

module.exports = usersService