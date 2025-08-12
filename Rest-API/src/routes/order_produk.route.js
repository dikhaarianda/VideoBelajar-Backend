const express = require('express')
const router = express.Router()
const ctrl = require('../controllers/order_produk.controller')

router.get('/', ctrl.getAll)
router.get('/:no_invoice', ctrl.getById)
router.post('/', ctrl.create)
router.patch('/:no_invoice', ctrl.updateById)
router.delete('/:no_invoice', ctrl.deleteById)

module.exports = router