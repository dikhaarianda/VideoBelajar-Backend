const knex = require('knex')
const dotenv = require('dotenv')
dotenv.config()

// knex use pool db connection
const db = knex({
  client: 'mysql2',
  connection: {
    host: process.env.DB_HOST || 'localhost',
    port: Number(process.env.DB_PORT || 3306),
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || 'password',
    database: process.env.DB_NAME || 'video_belajar'
  },
  pool: { min: 0, max: 10 }
})

module.exports = db