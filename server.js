// core
const http = require('http')

// local
const env = require('./lib/env.js')
const app = require('./lib/app.js')

// server
const server = http.createServer()
server.on('request', app)
server.listen(env.port, () => {
  console.log(`Listening on port ${env.port}`)
})
