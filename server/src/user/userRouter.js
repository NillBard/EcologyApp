const { Router } = require('express')

const { rescue } = require('../core/rescue')
const { isAuthenticated } = require('../auth/isAuthenticated')
const { UserController } = require('./UserController')

const userRouter = Router()
const userController = new UserController()

userRouter.get(
  '/me',
  isAuthenticated,
  rescue(userController.me.bind(userController)),
)

module.exports = {
  userRouter,
}
