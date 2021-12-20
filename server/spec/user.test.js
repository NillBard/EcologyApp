const { server } = require('./fixture/server')
const { authorize } = require('./fixture/authorize')

describe('User', () => {
  let token

  beforeEach(async () => {
    token = await authorize()
  })

  it('GET /api/users/me should return user', done => {
    server
      .get('/api/users/me')
      .set('Authorization', `Bearer ${token}`)
      .then(res => {
        expect(res.status).toEqual(200)
        expect(res.body.data.name).toBeDefined()
        expect(res.body.data.email).toBeDefined()
        expect(res.body.data.exp).toBeDefined()
        done()
      })
      .catch(done)
  })
})
