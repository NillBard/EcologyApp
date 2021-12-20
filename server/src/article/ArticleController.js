const { Controller } = require('../core/Controller')

module.exports = {
  ArticleController: class extends Controller {
    constructor() {
      super('article')
    }

    async findAll() {
      const data = await this.entity.findMany()
      return {
        status: 200,
        data: data.map(article => ({
          ...article,
          text: article.text.slice(0, 100),
        })),
      }
    }
  },
}
