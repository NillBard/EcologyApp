const { Controller } = require('../core/Controller')

module.exports = {
  AuthController: class extends Controller {
    constructor() {
      super('user')
    }

    async register(req, res) {}
  },
}
