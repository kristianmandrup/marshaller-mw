Class = require('jsclass/src/core').Class

requires  = require '../../../requires'

Marshaller = requires.lib 'marshaller'

PersonMarshaller = new Class(Marshaller,
  marshal: (data) ->
    @call-super!
    if @data.password?
      @data.password = @encrypt @data.password
    delete @data.status
    
    @delete-properties 'age', 'status'
    @data
)

module.exports = PersonMarshaller