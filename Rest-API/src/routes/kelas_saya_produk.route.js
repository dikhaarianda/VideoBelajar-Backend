const express = require('express')
const router = express.Router()
const ctrl = require('../controllers/kelas_saya_produk.controller')

router.get('/', ctrl.getAll)
router.get('/:kelas_saya/:produk', ctrl.getById)
router.post('/', ctrl.create)
router.patch('/:kelas_saya/:produk', ctrl.updateById)
router.delete('/:kelas_saya/:produk', ctrl.deleteById)

module.exports = router