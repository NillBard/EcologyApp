const { Controller } = require('../core/Controller')

module.exports = {
  UserController: class extends Controller {
    constructor() {
      super('user')
    }

    async tracker(req) {
      const data = {}

      Object.keys(req.body).forEach(key => {
        data[key] = req.user[key] + req.body[key]
      })

      const user = await this.entity.update({
        where: { id: Number(req.user.id) },
        data: {
          ...data,
          exp: Object.keys(req.body)
            .map(key => req.body[key])
            .reduce((acc, value) => acc + value, req.user.exp),
        },
      })

      return { status: 200, data: user }
    }

    me(req) {
      return { status: 200, data: req.user }
    }
  },
}
