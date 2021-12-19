const express = require('express')
const cors = require('cors')
const swaggerUI = require('swagger-ui-express')

const docs = require('../docs.json')
const { logger } = require('./core/logger')
const { errorHandler } = require('./core/errorHandler')
const { notFound } = require('./core/notFound')
const { seed } = require('./core/seed')

const { authRouter } = require('./auth/authRouter')
const { userRouter } = require('./user/userRouter')
const { articleRouter } = require('./article/articleRouter')

const app = express().use(express.json()).use(cors()).use(logger())

app.use('/api/docs', swaggerUI.serve, swaggerUI.setup(docs))
app.use('/api/auth', authRouter)
app.use('/api/users', userRouter)
app.use('/api/articles', articleRouter)

app.use(errorHandler())
app.use(notFound())
;(async () => await seed())()

module.exports = {
  server: app,
}
