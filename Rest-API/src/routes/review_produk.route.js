const express = require('express')
const router = express.Router()
const ctrl = require('../controllers/review_produk.controller')

router.get('/', ctrl.getAll)
router.get('/:siswa/:produk', ctrl.getById)
router.post('/', ctrl.create)
router.patch('/:siswa/:produk', ctrl.updateById)
router.delete('/:siswa/:produk', ctrl.deleteById)

module.exports = router