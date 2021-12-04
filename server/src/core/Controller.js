const { db } = require('./db')

module.exports = {
  Controller: class {
    constructor(entityName) {
      this.entity = db[entityName]
    }

    async findAll(_, res) {
      const data = await this.entity.findMany()
      res.json({ status: 200, data })
    }

    async findOne(req, res) {
      const data = await this.entity.findUnique({
        where: { id: Number(req.params.id) },
      })
      res.json({ status: 200, data })
    }

    async create(req, res) {
      const data = await this.entity.create({ data: req.body })
      res.json({ status: 201, data })
    }

    async update(req, res) {
      const data = await this.entity.update({
        where: { id: Number(req.params.id) },
        data: req.body,
      })
      res.json({ status: 200, data })
    }

    async delete(req, res) {
      await this.entity.delete({ where: { id: Number(req.params.id) } })
      res.json({ status: 204 })
    }
  },
}
