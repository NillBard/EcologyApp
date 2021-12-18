const { request } = require('./setup')

describe('User', () => {
  let token

  beforeAll(done => {
    request
      .post('/api/auth/register')
      .send({
        name: 'Jack Smith',
        email: 'jack@smith.uk',
        password: '123456',
      })
      .then(res => {
        token = res.body.data.accessToken
        done()
      })
      .catch(done)
  })

  it('GET /api/users/me should return user', done => {
    request
      .get('/api/users/me')
      .set('Authorization', `Bearer ${token}`)
      .then(res => {
        expect(res.body.status).toEqual(200)
        expect(res.body.data).toMatchObject({
          name: 'Jack Smith',
          email: 'jack@smith.uk',
          exp: 0,
        })
        done()
      })
      .catch(done)
  })
})
