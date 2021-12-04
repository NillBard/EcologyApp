module.exports = {
  logger() {
    return (req, _, next) => {
      console.log(
        `[${new Date().toLocaleTimeString()}]`,
        `${req.method} ${req.path}`,
      )
      next()
    }
  },
}
