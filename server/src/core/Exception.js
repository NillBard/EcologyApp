module.exports = {
  Exception: class extends Error {
    constructor(type, message) {
      super(message)
      this.code = type
    }
  },

  ExceptionTypes: {
    NotFound: 404,
    Unauthorized: 401,
    Conflict: 409,
  },
}
