Class = require('jsclass/src/core').Class

requires  = require '../../../requires'

Marshaller = requires.lib 'marshaller'

PersonMarshaller = new Class(Marshaller,
  initialize: (data) ->
    @call-super!

  set-data: (@data) ->
    @call-super!

  marshal: (data) ->
    @set-data data if data
    if @data is void
      throw Error "No data to marshal, please pass data-object to marshal either in the Marshaller constructor or directly when calling marshal"

    unless typeof @data is 'object'
      throw Error "Invalid data to marshal, must be an Object, was: #{@data}"

    if @data.password?
      @data.password = @encrypt @data.password
    delete @data.status
    
    @delete-properties 'age', 'color'
    @data
)

module.exports = PersonMarshaller