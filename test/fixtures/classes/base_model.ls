Class   = require('jsclass/src/core').Class

requires  = require '../../../requires'

BaseModel = new Class(
  # set my own attributes based on incoming object/hash
  initialize: (obj) ->
    _.keys(obj).each (key) ->
      @[key] = obj[key]
)

module.exports = BaseModel