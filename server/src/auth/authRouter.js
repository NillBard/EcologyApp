const { Router } = require('express')

const { rescue } = require('../core/rescue')
const { AuthController } = require('./AuthController')

const authRouter = Router()
const authController = new AuthController()

authRouter.post(
  '/register',
  rescue(authController.register.bind(authController)),
)

authRouter.post('/login', rescue(authController.login.bind(authController)))

module.exports = {
  authRouter,
}
