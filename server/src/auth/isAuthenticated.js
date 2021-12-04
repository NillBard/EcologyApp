const jwt = require('jsonwebtoken')

const { Exception, ExceptionTypes } = require('../core/Exception')

module.exports = {
  isAuthenticated(req, _, next) {
    const token =
      req.query.token || req.headers.authorization?.split('Bearer')[1]?.trim()

    if (!token) {
      throw new Exception(ExceptionTypes.Unauthorized, 'Authorization required')
    }

    try {
      jwt.verify(token, process.env.JWT_SECRET)
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
