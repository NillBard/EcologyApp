const { db } = require('./db')

module.exports = {
  Controller: class {
    constructor(entityName) {
      this.entity = db[entityName]
    }

    async findAll() {
      const data = await this.entity.findMany()
      return { status: 200, data }
    }

    async findOne(req) {
      const data = await this.entity.findUnique({
        where: { id: Number(req.params.id) },
      })
      return { status: 200, data }
    }

    async create(req) {
      const data = await this.entity.create({ data: req.body })
      return { status: 201, data }
    }

    async update(req) {
      const data = await this.entity.update({
        where: { id: Number(req.params.id) },
        data: req.body,
      })
      return { status: 200, data }
    }

    async delete(req) {
      await this.entity.delete({ where: { id: Number(req.params.id) } })
      return { status: 204 }
    }
  },
}
