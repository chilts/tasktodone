// npm
const express = require('express')
const morgan = require('morgan')

// local
const env = require('./env.js')

// app
const app = express()

// middleware
app.use(morgan(env.isProd ? 'combined' : 'dev'))

// routes
app.get('/', (req, res) => {
  res.send("Hello, World!\n")
})

// exports
module.exports = app
