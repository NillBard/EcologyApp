const jwt = require('jsonwebtoken')
const bcrypt = require('bcrypt')

const { Controller } = require('../core/Controller')
const { Exception, ExceptionTypes } = require('../core/Exception')

function omitPassword(user) {
  return { name: user.name, email: user.email, id: user.id }
}

module.exports = {
  AuthController: class extends Controller {
    constructor() {
      super('user')
    }

    async register(req, res) {
      const candidate = this.entity.findUnique({
        where: { email: req.body.email },
      })

      if (candidate) {
        throw new Exception(
          ExceptionTypes.Conflict,
          'User with given email already exists',
        )
      }

      const hashedPassowrd = await bcrypt.hash(req.body.password, 10)
      const user = await this.entity.create({
        data: { ...req.body, password: hashedPassowrd },
      })
      const token = jwt.sign(omitPassword(user), process.env.JWT_SECRET, {
        expiresIn: '1 day',
      })

      res.json({ status: 201, data: { token } })
    }

    async login(req, res) {
      const user = this.entity.findUnique({
        where: { email: req.body.email },
      })

      if (!user) {
        throw new Exception(
          ExceptionTypes.NotFound,
          `User with given email doesn't exist`,
        )
      }

      const isPasswordValid = await bcrypt.compare(
        req.body.password,
        user.password,
      )

      if (!isPasswordValid) {
        throw new Exception(ExceptionTypes.Unauthorized, 'Wrong password')
      }

      const token = jwt.sign(omitPassword(user), process.env.JWT_SECRET, {
        expiresIn: '1 day',
      })

      res.json({ status: 200, data: { token } })
    }
  },
}
