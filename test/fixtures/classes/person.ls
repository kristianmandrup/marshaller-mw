requires  = require '../../../requires'

_  = require 'prelude-ls'

Class = require('jsclass/src/core').Class

BaseModel = requires.clazz 'base_model'

Person = new Class(BaseModel,
  initialize: (obj) ->
    @callSuper!

  fullName: ->
    [@firs-name, @last-name].join ' '
)

module.exports = Person