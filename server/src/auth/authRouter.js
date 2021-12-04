const { Router } = require('express')

const { AuthController } = require('./AuthController')

const authRouter = Router()
const authController = new AuthController()

authRouter.post('/register', authController.register.bind(authController))

authRouter.post('/login', authController.login.bind(authController))

module.exports = {
  authRouter,
}
