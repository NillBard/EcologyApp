const { Router } = require('express')

const { rescue } = require('../core/rescue')
const { ArticleController } = require('./ArticleController')

const { articleSchema } = require('./articleSchema')

const articleRoute = Router()
const articleController = new ArticleController()

articleRoute.post(
  '/add-article',
  rescue(articleController.addArticle.bind(articleController), articleSchema),
)

articleRoute.get(
  '/:id',
  rescue(articleController.getArticle.bind(articleController)),
)

articleRoute.get(
  '/',
  rescue(articleController.getArticleList.bind(articleController)),
)

module.exports = {
  articleRoute,
}
