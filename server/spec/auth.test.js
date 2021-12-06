const { request } = require('./setup')

describe('Auth', () => {
  describe('Unauthorized users', () => {
    it('POST /api/auth/register should create new user', done => {
      request
        .post('/api/auth/register')
        .send({
          name: 'John Smith',
          email: 'john@smith.uk',
          password: '123456',
        })
        .then(res => {
          expect(res.body.status).toEqual(201)
          expect(typeof res.body.data.accessToken).toEqual('string')
          expect(typeof res.body.data.refreshToken).toEqual('string')
          done()
        })
        .catch(done)
    })

    it('POST /api/auth/login should sign user in', done => {
      request
        .post('/api/auth/login')
        .send({ email: 'john@smith.uk', password: '123456' })
        .then(res => {
          expect(res.body.status).toEqual(200)
          expect(typeof res.body.data.accessToken).toEqual('string')
          expect(typeof res.body.data.refreshToken).toEqual('string')
          done()
        })
        .catch(done)
    })
  })

  describe('Authorized users', () => {
    let refreshToken

    beforeEach(done => {
      request
        .post('/api/auth/login')
        .send({ email: 'john@smith.uk', password: '123456' })
        .then(res => {
          refreshToken = res.body.data.refreshToken
          done()
        })
        .catch(done)
    })

    it('POST /api/auth/refresh-tokens should update pair of tokens', done => {
      request
        .post('/api/auth/refresh-tokens')
        .send({ token: refreshToken })
        .then(res => {
          expect(res.body.status).toEqual(200)
          expect(typeof res.body.data.accessToken).toEqual('string')
          expect(typeof res.body.data.refreshToken).toEqual('string')
          done()
        })
        .catch(done)
    })
  })
})
