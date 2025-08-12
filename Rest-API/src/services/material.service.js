const { buildService } = require('../utils/base.service')
const materialService = buildService('material', ['id_material'])

module.exports = materialService