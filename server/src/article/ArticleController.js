const { Controller } = require('../core/Controller')
const { Exception, ExceptionTypes } = require('../core/Exception')

module.exports = {
  ArticleController: class extends Controller {
    constructor() {
      super('article')
    }

    async addArticle(req, res) {
      let date = new Date()

      const article = await this.entity.create({
        data: {
          ...req.body,
          date: `${date.toLocaleDateString()} ${date
            .toLocaleTimeString()
            .slice(0, -3)}`,
        },
      })

      res.json({ status: 201, data: { article } })
    }

    async getArticle(_, res) {
      const article = await this.entity.findOne()
      if (!article) {
        throw new Exception(ExceptionTypes.NotFound, `Article is not found`)
      }
      res.json({ status: 200, data: { article } })
    }

    async getArticleList(_, res) {
      const article = await this.entity.findAll()
      if (!article) {
        throw new Exception(ExceptionTypes.NotFound, `Something wrong`)
      }
      res.json({ status: 200, data: { article } })
    }
  },
}
