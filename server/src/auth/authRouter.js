const { Router } = require('express')

const { rescue } = require('../core/rescue')
const { AuthController } = require('./AuthController')
const {
  registerSchema,
  loginSchema,
  authenticateSchema,
} = require('./authSchema')

const authRouter = Router()
const authController = new AuthController()

authRouter.post(
  '/register',
  rescue(authController.register.bind(authController), registerSchema),
)

authRouter.post(
  '/login',
  rescue(authController.login.bind(authController), loginSchema),
)

authRouter.post(
  '/refresh-tokens',
  rescue(authController.refreshTokens.bind(authController), authenticateSchema),
)

module.exports = {
  authRouter,
}
