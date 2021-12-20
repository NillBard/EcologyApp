const { Router } = require('express')

const { isAuthenticated } = require('../auth/isAuthenticated')
const { rescue } = require('../core/rescue')
const { ArticleController } = require('./ArticleController')

const articleRouter = Router()
const articleController = new ArticleController()

articleRouter.get(
  '/:id',
  isAuthenticated,
  rescue(articleController.findOne.bind(articleController)),
)

articleRouter.get(
  '/',
  isAuthenticated,
  rescue(articleController.findAll.bind(articleController)),
)

module.exports = {
  articleRouter,
}
