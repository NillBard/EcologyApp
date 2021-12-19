const { server } = require('./fixture/server')
const { authorize } = require('./fixture/authorize')

describe('Article', () => {
  let token

  beforeEach(async () => {
    token = await authorize()
  })

  it('GET /api/articles should return all articles', done => {
    server
      .get('/api/articles')
      .set('Authorization', `Bearer ${token}`)
      .then(res => {
        expect(res.status).toEqual(200)
        expect(res.body.data.length).toBeGreaterThan(0)
        expect(res.body.data[0].title).toBeDefined()
        expect(res.body.data[0].text).toBeDefined()
        done()
      })
      .catch(done)
  })

  it('GET /api/articles should return short versions of articles', done => {
    server
      .get('/api/articles')
      .set('Authorization', `Bearer ${token}`)
      .then(res => {
        expect(res.status).toEqual(200)
        expect(res.body.data[0].text).toHaveLength(100)
        done()
      })
  })

  it('GET /api/articles/:id should return article', done => {
    server
      .get('/api/articles')
      .set('Authorization', `Bearer ${token}`)
      .then(res => {
        server
          .get(`/api/articles/${res.body.data[0].id}`)
          .set('Authorization', `Bearer ${token}`)
          .then(res => {
            expect(res.status).toEqual(200)
            expect(res.body.data.title).toBeDefined()
            expect(res.body.data.text).toBeDefined()
            done()
          })
      })
  })
})
