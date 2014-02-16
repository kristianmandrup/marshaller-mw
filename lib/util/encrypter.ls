Class = require('jsclass/src/core').Class

Encrypter = new Class(
  # override!!
  encrypt: (data) ->
    "x-#{data}-x"
)

module.exports = Encrypter