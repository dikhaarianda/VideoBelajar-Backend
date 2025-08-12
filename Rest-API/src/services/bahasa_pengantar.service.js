const { buildService } = require('../utils/base.service')
const bahasaPengantarService = buildService('bahasa_pengantar', ['modul', 'bahasa'])

module.exports = bahasaPengantarService