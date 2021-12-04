module.exports = {
  errorHandler() {
    return (err, _, res, next) => {
      if (err) {
        console.error(err.message)
        if (err.code === 500) {
          console.error(err.stack)
        }
        res.json({ status: err.code, error: { message: err.message } })
      } else {
        next()
      }
    }
  },
}
