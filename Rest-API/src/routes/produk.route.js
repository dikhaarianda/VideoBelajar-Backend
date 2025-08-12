const express = require('express')
const router = express.Router()
const ctrl = require('../controllers/produk.controller')

router.get('/', ctrl.getAll)
router.get('/:id_produk', ctrl.getById)
router.post('/', ctrl.create)
router.patch('/:id_produk', ctrl.updateById)
router.delete('/:id_produk', ctrl.deleteById)

module.exports = router