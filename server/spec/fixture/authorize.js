const { server } = require('./server')

module.exports = {
  authorize() {
    const username = `User-${Date.now()}`
    return new Promise(resolve => {
      server
        .post('/api/auth/register')
        .send({
          name: username,
          email: `${username}@test.com`,
          password: '123456',
        })
        .then(res => {
          resolve(res.body.data.accessToken)
        })
    })
  },
}
