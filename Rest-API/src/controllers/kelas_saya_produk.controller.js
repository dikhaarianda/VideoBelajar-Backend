const service = require('../services/kelas_saya_produk.service')
const { buildCrudController } = require('../utils/crud.controller')

module.exports = buildCrudController({
  service,
  pkFields: ['kelas_saya', 'produk'],
  resourceName: 'kelas_saya_produk'
})