const express = require('express')
const router = express.Router()
const ctrl = require('../controllers/rating_tutor.controller')

router.get('/', ctrl.getAll)
router.get('/:siswa/:tutor', ctrl.getById)
router.post('/', ctrl.create)
router.patch('/:siswa/:tutor', ctrl.updateById)
router.delete('/:siswa/:tutor', ctrl.deleteById)

module.exports = router