const express = require('express')
const router = express.Router()
const ctrl = require('../controllers/kategori.controller')

router.get('/', ctrl.getAll)
router.get('/:id_kategori', ctrl.getById)
router.post('/', ctrl.create)
router.patch('/:id_kategori', ctrl.updateById)
router.delete('/:id_kategori', ctrl.deleteById)

module.exports = router