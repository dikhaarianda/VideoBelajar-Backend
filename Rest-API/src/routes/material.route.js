const express = require('express')
const router = express.Router()
const ctrl = require('../controllers/material.controller')

router.get('/', ctrl.getAll)
router.get('/:id_material', ctrl.getById)
router.post('/', ctrl.create)
router.patch('/:id_material', ctrl.updateById)
router.delete('/:id_material', ctrl.deleteById)

module.exports = router