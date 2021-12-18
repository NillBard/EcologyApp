const jwt = require('jsonwebtoken')

const { db } = require('../core/db')
const { Exception, ExceptionTypes } = require('../core/Exception')

module.exports = {
  async isAuthenticated(req, _, next) {
    const token =
      req.query.token || req.headers.authorization?.split('Bearer')[1]?.trim()

    if (!token) {
      throw new Exception(ExceptionTypes.Unauthorized, 'Authorization required')
    }

    try {
      const { id } = jwt.verify(token, process.env.JWT_SECRET)
      const user = await db.user.findUnique({ where: { id } })

      delete user.password
      req.user = user
      next()
    } catch (err) {
      if (err instanceof jwt.TokenExpiredError) {
        throw new Exception(ExceptionTypes.Unauthorized, 'Token expired')
      } else {
        throw new Exception(ExceptionTypes.Unauthorized, 'Invalid token')
      }
    }
  },
}
