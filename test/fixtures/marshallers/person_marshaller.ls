Class = require('jsclass/src/core').Class

requires  = require '../../../requires'

Marshaller = requires.lib 'marshaller'

PersonMarshaller = new Class(Marshaller,
  intialize: (@data) ->
    @call-super!

  marshal: ->
    if @data.password
      @data.password = @encrypt @data.password
    delete @data.status
    
    @delete-properties 'age', 'color'
    @data
)

module.exports = PersonMarshaller