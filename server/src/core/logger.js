module.exports = {
  logger() {
    return (req, _, next) => {
      console.log(
        `[${new Date().toLocaleTimeString()}]`,
        `${req.method} ${req.path}`,
      )
      if (req.body) {
        console.log(`[Body] ${JSON.stringify(req.body)}`)
      }
      next()
    }
  },
}
