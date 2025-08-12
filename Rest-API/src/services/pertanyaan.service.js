const { buildService } = require('../utils/base.service')
const pertanyaanService = buildService('pertanyaan', ['id_pertanyaan'])

module.exports = pertanyaanService