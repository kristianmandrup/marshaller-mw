Class = require('jsclass/src/core').Class

Encrypter = requires.util 'encrypter'

Marshaller = new Class(
  delete-properties: (...names) ->
    names.flatten.compact.each (name) ->
      delete @data[name]
 
  encrypt: (value) ->
    @encrypter.encrypt value
 
  encrypter: ->
    new Encrypter
)

module.exports = Marshaller
