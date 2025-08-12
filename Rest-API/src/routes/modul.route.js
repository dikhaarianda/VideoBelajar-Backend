const express = require('express')
const router = express.Router()
const ctrl = require('../controllers/modul.controller')

router.get('/', ctrl.getAll)
router.get('/:id_modul', ctrl.getById)
router.post('/', ctrl.create)
router.patch('/:id_modul', ctrl.updateById)
router.delete('/:id_modul', ctrl.deleteById)

module.exports = router