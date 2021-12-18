const { Controller } = require('../core/Controller')

module.exports = {
  UserController: class extends Controller {
    constructor() {
      super('user')
    }

    me(req, res) {
      res.json({ status: 200, data: req.user })
    }
  },
}
