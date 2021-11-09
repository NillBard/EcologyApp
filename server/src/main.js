const express = require('express')
const cors = require('cors')

const PORT = process.env.PORT || 4200
const HOST = process.env.HOST || '0.0.0.0'

const app = express().use(cors())

app.listen(PORT, HOST, () => console.log(`Server has started on port ${PORT}`))
