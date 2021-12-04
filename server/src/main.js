const express = require('express')
const cors = require('cors')
const swaggerUI = require('swagger-ui-express')

const docs = require('../docs.json')
const { logger } = require('./core/logger')
const { errorHandler } = require('./core/errorHandler')
const { notFound } = require('./core/notFound')

const { authRouter } = require('./auth/authRouter')

const PORT = 4200
const HOST = process.env.HOST || '0.0.0.0'

const app = express().use(express.json()).use(cors()).use(logger())

app.use('/api/docs', swaggerUI.serve, swaggerUI.setup(docs))
app.use('/api/auth', authRouter)

app.use(errorHandler())
app.use(notFound())

app.listen(PORT, HOST, () => console.log(`Server has started on port ${PORT}`))
