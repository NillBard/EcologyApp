const { server } = require('./server')

const PORT = 4200
const HOST = process.env.HOST || '0.0.0.0'

server.listen(PORT, HOST, () =>
  console.log(`Server has started on port ${PORT}`),
)
