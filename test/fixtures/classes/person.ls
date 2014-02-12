rek       = require 'rekuire'
requires  = rek 'requires'

_  = require 'prelude-ls'

Class = require('jsclass/src/core').Class

BaseModel = requires.clazz 'base_model'

module.exports = new Class(BaseModel,
  initialize: (obj) ->
    @callSuper!

  fullName: ->
    [@firs-name, @last-name].join ' '
)