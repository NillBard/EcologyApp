const { Controller } = require('../core/Controller')

module.exports = {
  UserController: class extends Controller {
    constructor() {
      super('user')
    }

    me(req) {
      return { status: 200, data: req.user }
    }
  },
}
