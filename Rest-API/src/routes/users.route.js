const express = require('express')
const router = express.Router()
const ctrl = require('../controllers/users.controller')

router.get('/', ctrl.getAll)
router.get('/:id_user', ctrl.getById)
router.post('/', ctrl.create)
router.patch('/:id_user', ctrl.updateById)
router.delete('/:id_user', ctrl.deleteById)

module.exports = router