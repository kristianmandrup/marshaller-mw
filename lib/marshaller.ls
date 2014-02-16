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
