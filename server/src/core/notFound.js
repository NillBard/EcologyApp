module.exports = {
  notFound() {
    return (_, res) => {
      console.error('Not found')
      res.json({ status: 404, error: { message: 'Resource not found' } })
    }
  },
}
