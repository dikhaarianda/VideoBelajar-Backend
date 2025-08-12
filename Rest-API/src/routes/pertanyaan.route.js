const express = require('express')
const router = express.Router()
const ctrl = require('../controllers/pertanyaan.controller')

router.get('/', ctrl.getAll)
router.get('/:id_pertanyaan', ctrl.getById)
router.post('/', ctrl.create)
router.patch('/:id_pertanyaan', ctrl.updateById)
router.delete('/:id_pertanyaan', ctrl.deleteById)

module.exports = router