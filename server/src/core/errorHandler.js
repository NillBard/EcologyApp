module.exports = {
  errorHandler() {
    return (err, _, res, next) => {
      if (err) {
        console.error(err.message)
        if (err.code === 500 || !err.code) {
          console.error(err.stack)
        }
        res.json({
          status: typeof err.code === 'number' ? err.code : 500,
          error: { message: err.message },
        })
      } else {
        next()
      }
    }
  },
}
