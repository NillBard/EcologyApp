module.exports = {
  errorHandler() {
    return (err, _, res, next) => {
      if (err) {
        console.error(
          `\x1b[36m[${new Date().toLocaleTimeString()}] \x1b[31mError: ${
            err.message
          }`,
        )
        if (err.code === 500 || !err.code) {
          console.error('\x1b[31m', err.stack)
        }
        res.status(typeof err.code === 'number' ? err.code : 500).json({
          error: { message: err.message },
        })
      } else {
        next()
      }
    }
  },
}
