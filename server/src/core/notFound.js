module.exports = {
  notFound() {
    return (_, res) => {
      console.error('Not found')
      res.status(404).json({ error: { message: 'Resource not found' } })
    }
  },
}
