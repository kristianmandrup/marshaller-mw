Class = require('jsclass/src/core').Class

Encrypter = new Class(
  # override!!
  encrypt: (data) ->
    "x-#{data}-x"
)

Marshaller = new Class(
  delete-properties: (...names) ->
    names.flatten.compact.each (name) ->
      delete @data[name]
 
  encrypt: (value) ->
    @encrypter.encrypt value
 
  encrypter: ->
    new Encrypter
)
 
PersonMarshaller = new Class(Marshaller,
  intialize: (@data) ->
    @call-super!

  marshal: ->
    @encrypt @data.password
    delete @data.status
    
    delete-properties 'age', 'color'
    @data
)