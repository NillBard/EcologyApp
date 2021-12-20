const { Router } = require('express')

const { rescue } = require('../core/rescue')
const { isAuthenticated } = require('../auth/isAuthenticated')
const { UserController } = require('./UserController')
const { trackerSchema } = require('./trackerSchema')

const userRouter = Router()
const userController = new UserController()

userRouter.get(
  '/me',
  isAuthenticated,
  rescue(userController.me.bind(userController)),
)
userRouter.post(
  '/me/tracker',
  isAuthenticated,
  rescue(userController.tracker.bind(userController), trackerSchema),
)

module.exports = {
  userRouter,
}
