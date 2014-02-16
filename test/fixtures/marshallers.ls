requires  = require '../../requires'

requires.marshaller 'person'

module.exports =
    person: (data) ->
      new PersonMarshaller data