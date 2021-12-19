const { Exception, ExceptionTypes } = require('../core/Exception')

module.exports = {
  rescue(handler, schema) {
    return async (req, res, next) => {
      if (schema) {
        try {
          await schema.validate(req.body)
        } catch (err) {
          return next(
            new Exception(ExceptionTypes.UnprocessableEntity, err.errors[0]),
          )
        }
      }

      try {
        const payload = await handler(req, res, next)
        res.status(payload.status).json({ data: payload.data })
      } catch (err) {
        next(err)
      }
    }
  },
}
