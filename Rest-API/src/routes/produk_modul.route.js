const express = require('express')
const router = express.Router()
const ctrl = require('../controllers/produk_modul.controller')

router.get('/', ctrl.getAll)
router.get('/:produk/:modul', ctrl.getById)
router.post('/', ctrl.create)
router.patch('/:produk/:modul', ctrl.updateById)
router.delete('/:produk/:modul', ctrl.deleteById)

module.exports = router