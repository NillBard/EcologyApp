const { request } = require('./setup')

describe('Auth', () => {
  it('POST /api/auth/register should create new user', done => {
    request
      .post('/api/auth/register')
      .send({ name: 'John Smith', email: 'john@smith.uk', password: '123456' })
      .expect(res => {
        expect(res.body.status).toEqual(201)
        expect(typeof res.body.data.token).toEqual('string')
        done()
      })
      .catch(done)
  })

  it('POST /api/auth/login should sign user in', done => {
    request
      .post('/api/auth/login')
      .send({ email: 'john@smith.uk', password: '123456' })
      .expect(res => {
        expect(res.body.status).toEqual(200)
        expect(typeof res.body.data.token).toEqual('string')
        done()
      })
      .catch(done)
  })
})
