// general
const nodeEnv = process.env.NODE_ENV
const isDev = nodeEnv === 'dev' || nodeEnv === 'development'
const isTest = nodeEnv === 'test' || nodeEnv === 'testing'
const isProd = nodeEnv === 'prod' || nodeEnv === 'production'

// Server
const port = process.env.PORT || 3000

// User
const username = process.env.USERNAME
const password = process.env.PASSWORD

// Database
const dbUrl = process.env.DB_URL

// create the entire env
const env = {
  // General
  nodeEnv,
  isDev,
  isTest,
  isProd,
  // Server
  port,
  // User
  username,
  password,
  // Database
  dbUrl,
}

if (isDev) {
  console.log('env:', env)
}

// delete stuff so other packages can't get at them
delete process.env.PORT
delete process.env.USERNAME
delete process.env.PASSWORD
delete process.env.DB_URL

// exports
module.exports = env
