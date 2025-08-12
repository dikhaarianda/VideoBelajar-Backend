const { buildService } = require('../utils/base.service')
const produkModulService = buildService('produk_modul', ['produk', 'modul'])

module.exports = produkModulService