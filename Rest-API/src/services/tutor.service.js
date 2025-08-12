const { buildService } = require('../utils/base.service')
const tutorService = buildService('tutor', ['id_tutor'])

module.exports = tutorService