const config = require('../../config')
export const serve = config.serve + "/api"
export const CREDENTIALS = { credentials: 'include' }
export const HEADERS = {
  JSON: { 'Content-Type': 'application/json' }
}
