const { buildService } = require('../utils/base.service')
const ratingTutorService = buildService('rating_tutor', ['siswa', 'tutor'])

module.exports = ratingTutorService