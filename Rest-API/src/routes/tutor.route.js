const express = require('express')
const router = express.Router()
const ctrl = require('../controllers/tutor.controller')

router.get('/', ctrl.getAll)
router.get('/:id_tutor', ctrl.getById)
router.post('/', ctrl.create)
router.patch('/:id_tutor', ctrl.updateById)
router.delete('/:id_tutor', ctrl.deleteById)

module.exports = router