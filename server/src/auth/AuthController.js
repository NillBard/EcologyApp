const yup = require('yup')
const jwt = require('jsonwebtoken')
const bcrypt = require('bcrypt')

const { Controller } = require('../core/Controller')
const { Exception, ExceptionTypes } = require('../core/Exception')

const registerBody = yup.object().shape({
  name: yup
    .string()
    .required()
    .min(3, `Name must be at least 3 characters long`),
  email: yup.string().email().required(),
  password: yup
    .string()
    .required()
    .min(6, `Password must be at least 6 characters long`),
})

const loginBody = yup.object().shape({
  email: yup.string().email().required(),
  password: yup.string().required(),
})

const authenticateBody = yup.object().shape({
  token: yup.string().required(),
})

module.exports = {
  AuthController: class extends Controller {
    constructor() {
      super('user')
    }

    _generateAccessToken(payload) {
      return jwt.sign(payload, process.env.JWT_SECRET, { expiresIn: 60 * 30 })
    }

    _generateRefreshToken(payload) {
      return jwt.sign(payload, process.env.JWT_SECRET, { expiresIn: '30d' })
    }

    async register(req, res) {
      try {
        await registerBody.validate(req.body)
      } catch (err) {
        throw new Exception(ExceptionTypes.UnprocessableEntity, err.errors[0])
      }

      const candidate = await this.entity.findUnique({
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
      const refreshToken = this._generateRefreshToken({ id: user.id })
      const accessToken = this._generateAccessToken({
        id: user.id,
        email: user.email,
        name: user.name,
      })

      res.json({ status: 201, data: { accessToken, refreshToken } })
    }

    async login(req, res) {
      try {
        await loginBody.validate(req.body)
      } catch (err) {
        throw new Exception(ExceptionTypes.UnprocessableEntity, err.errors[0])
      }

      const user = await this.entity.findUnique({
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

      const refreshToken = this._generateRefreshToken({ id: user.id })
      const accessToken = this._generateAccessToken({
        id: user.id,
        name: user.name,
        email: user.email,
      })

      res.json({ status: 200, data: { accessToken, refreshToken } })
    }

    async refreshTokens(req, res) {
      try {
        await authenticateBody.validate(req.body)
      } catch (err) {
        throw new Exception(ExceptionTypes.UnprocessableEntity, err.errors[0])
      }

      try {
        const { id } = jwt.verify(req.body.token, process.env.JWT_SECRET)
        const user = await this.entity.findUnique({ where: { id } })
        const refreshToken = this._generateRefreshToken({ id })
        const accessToken = this._generateAccessToken({
          id,
          name: user.name,
          email: user.email,
        })

        res.json({ status: 200, data: { accessToken, refreshToken } })
      } catch (err) {
        if (err instanceof jwt.TokenExpiredError) {
          throw new Exception(ExceptionTypes.Unauthorized, 'Token expired')
        } else {
          throw new Exception(ExceptionTypes.Unauthorized, 'Invalid token')
        }
      }
    }
  },
}
