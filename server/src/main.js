const express = require('express')
const cors = require('cors')

const { logger } = require('./core/logger')
const { errorHandler } = require('./core/errorHandler')
const { notFound } = require('./core/notFound')

const PORT = process.env.PORT || 4200
const HOST = process.env.HOST || '0.0.0.0'

const app = express()
  .use(express.json())
  .use(cors())
  .use(logger())
  .use(errorHandler())
  .use(notFound())

app.listen(PORT, HOST, () => console.log(`Server has started on port ${PORT}`))
