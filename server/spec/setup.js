const supertest = require('supertest')

const { server } = require('../src/server')

module.exports = {
  request: supertest(server),
}
