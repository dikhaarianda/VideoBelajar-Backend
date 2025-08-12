const express = require('express')
const router = express.Router()
const ctrl = require('../controllers/bahasa_pengantar.controller')

router.get('/', ctrl.getAll)
router.get('/:modul/:bahasa', ctrl.getById)
router.post('/', ctrl.create)
router.patch('/:modul/:bahasa', ctrl.updateById)
router.delete('/:modul/:bahasa', ctrl.deleteById)

module.exports = router