const { buildService } = require('../utils/base.service')
const kelasSayaService = buildService('kelas_saya', ['id_kelas_saya'])

module.exports = kelasSayaService