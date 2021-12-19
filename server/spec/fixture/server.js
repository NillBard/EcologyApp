const supertest = require('supertest')

const { server } = require('../../src/server')

module.exports = {
  server: supertest(server),
}
