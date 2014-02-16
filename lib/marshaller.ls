Class = require('jsclass/src/core').Class

requires  = require '../requires'
lo        = require 'lodash'

Encrypter = requires.util 'encrypter'

Marshaller = new Class(
  initialize: (data) ->
    @set-data data
    @

  # override to do specific initialization
  set-data: (data) ->
    @data = lo.extend {}, data

  marshal: (data) ->
    @set-data data if data
    if @data is void
      throw Error "No data to marshal, please pass data-object to marshal either in the Marshaller constructor or directly when calling marshal"

    unless typeof @data is 'object'
      throw Error "Invalid data to marshal, must be an Object, was: #{@data}"

  delete-properties: (...names) ->
    return if lo.is-empty names
    self = @
    names.flatten!.each (name) ->
      delete self.data[name]
 
  encrypt: (value) ->
    @encrypter.encrypt value
 
  encrypter: ->
    new Encrypter
)

module.exports = Marshaller
