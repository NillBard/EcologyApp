const { Controller } = require('../core/Controller')

module.exports = {
  UserController: class extends Controller {
    constructor() {
      super('user')
    }

    async tracker(req) {
      const user = await this.entity.update({
        where: { id: Number(req.user.id) },
        data: req.body,
      })

      return { status: 200, data: user }
    }

    me(req) {
      return { status: 200, data: req.user }
    }
  },
}
