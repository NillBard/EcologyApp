const { server } = require('./fixture/server')
const { authorize } = require('./fixture/authorize')

describe('Auth', () => {
  describe('Unauthorized users', () => {
    it('POST /api/auth/register should create new user', done => {
      server
        .post('/api/auth/register')
        .send({
          name: 'John Smith',
          email: 'john@smith.uk',
          password: '123456',
        })
        .then(res => {
          expect(res.status).toEqual(201)
          expect(typeof res.body.data.accessToken).toEqual('string')
          expect(typeof res.body.data.refreshToken).toEqual('string')
          done()
        })
        .catch(done)
    })

    it('POST /api/auth/login should sign user in', done => {
      server
        .post('/api/auth/login')
        .send({ email: 'john@smith.uk', password: '123456' })
        .then(res => {
          expect(res.status).toEqual(200)
          expect(typeof res.body.data.accessToken).toEqual('string')
          expect(typeof res.body.data.refreshToken).toEqual('string')
          done()
        })
        .catch(done)
    })
  })

  describe('Authorized users', () => {
    let token

    beforeEach(async () => {
      token = await authorize()
    })

    it('POST /api/auth/refresh-tokens should update pair of tokens', done => {
      server
        .post('/api/auth/refresh-tokens')
        .send({ token })
        .then(res => {
          expect(res.status).toEqual(200)
          expect(typeof res.body.data.accessToken).toEqual('string')
          expect(typeof res.body.data.refreshToken).toEqual('string')
          done()
        })
        .catch(done)
    })
  })
})
