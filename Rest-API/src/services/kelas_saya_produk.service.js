const { buildService } = require('../utils/base.service')
const kelasSayaProdukService = buildService('kelas_saya_produk', ['kelas_saya', 'produk'])

module.exports = kelasSayaProdukService