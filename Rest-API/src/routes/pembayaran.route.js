const express = require('express')
const router = express.Router()
const ctrl = require('../controllers/pembayaran.controller')

router.get('/', ctrl.getAll)
router.get('/:id_pembayaran', ctrl.getById)
router.post('/', ctrl.create)
router.patch('/:id_pembayaran', ctrl.updateById)
router.delete('/:id_pembayaran', ctrl.deleteById)

module.exports = router