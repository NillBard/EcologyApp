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
        await handler(req, res, next)
      } catch (err) {
        next(err)
      }
    }
  },
}
