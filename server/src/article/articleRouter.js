const { Router } = require('express')

const { rescue } = require('../core/rescue')
const { ArticleController } = require('./ArticleController')

const articleRouter = Router()
const articleController = new ArticleController()

articleRouter.get(
  '/:id',
  rescue(articleController.findOne.bind(articleController)),
)

articleRouter.get(
  '/',
  rescue(articleController.findAll.bind(articleController)),
)

module.exports = {
  articleRouter,
}
