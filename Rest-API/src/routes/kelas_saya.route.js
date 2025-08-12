const express = require('express')
const router = express.Router()
const ctrl = require('../controllers/kelas_saya.controller')

router.get('/', ctrl.getAll)
router.get('/:id_kelas_saya', ctrl.getById)
router.post('/', ctrl.create)
router.patch('/:id_kelas_saya', ctrl.updateById)
router.delete('/:id_kelas_saya', ctrl.deleteById)

module.exports = router