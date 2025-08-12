const { buildService } = require('../utils/base.service')
const kategoriService = buildService('kategori', ['id_kategori'])

module.exports = kategoriService