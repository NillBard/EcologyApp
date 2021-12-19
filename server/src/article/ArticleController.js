const { Controller } = require('../core/Controller')

module.exports = {
  ArticleController: class extends Controller {
    constructor() {
      super('article')
    }

    async findAll(_, res) {
      const data = await this.entity.findMany()
      res.json({
        status: 200,
        data: data.map(article => ({
          ...article,
          text: article.text.slice(0, 100),
        })),
      })
    }
  },
}
