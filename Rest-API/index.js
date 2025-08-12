require('dotenv').config()
const express = require('express')
const cors = require('cors')
const app = express()

app.use(cors())
app.use(express.json())

app.get('/health', (req, res) => {
  res.json({ success: true, message: 'ok', data: { uptime: process.uptime() } })
})

const appRouter = require('./src/utils/app')
app.use('/', appRouter)

// port from env or default 3000
const PORT = Number(process.env.PORT || 3000)

app.listen(PORT, () => {
  console.log(`[server] server is running...on port ${PORT}`)
})