module.exports = {
  logger() {
    return (req, _, next) => {
      console.log(
        `\x1b[36m[${new Date().toLocaleTimeString()}]`,
        `\x1b[33m${req.method} ${req.path}`,
      )
      if (req.body) {
        console.log(
          `\x1b[36m[${new Date().toLocaleTimeString()}] \x1b[33mBody: ${JSON.stringify(
            req.body,
          )}`,
        )
      }
      next()
    }
  },
}
