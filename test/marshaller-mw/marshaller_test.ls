requires  = require '../../requires'

requires.test 'test_setup'

assert = require('chai').assert
expect = require('chai').expect

_  = require 'prelude-ls'

Person              = requires.clazz 'person'

PersonMarshaller    = requires.marshaller 'person_marshaller'

person =
  name: 'Joe 6 Pack'
  age: 28
  status: 'single'
  clazz: 'person' # important!

describe 'Marshaller' ->
  var some-hash, marshallers

  mshal = {}

  describe 'marshal' ->
    context 'PersonMarshaller' ->
      var res
      before ->
        mshal.person = new PersonMarshaller person

      describe 'marshal!' ->
        specify 'no data to marshal should fail' ->
          expect(-> mshal.person.marshal!).to.throw

  describe 'marshal' ->
    context 'PersonMarshaller inits data as person' ->
      var res
      before ->
        mshal.person = new PersonMarshaller person
        res := mshal.person.marshal!

      describe 'marshal!' ->
        specify 'returns new marhalled object' ->
          expect(res).to.not.equal person

        specify 'has same name' ->
          expect(res.name).to.equal person.name

        specify 'has removed age' ->
          expect(res.age).to.equal void

  describe 'marshal person' ->
    context 'PersonMarshaller' ->
      var res
      before ->
        mshal.person = new PersonMarshaller

        # person arg for marshal function
        res := mshal.person.marshal person

      describe 'marshal  person' ->
        specify 'returns new marhalled object' ->
          expect(res).to.not.equal person

        specify 'has same name' ->
          expect(res.name).to.equal person.name

        specify 'has removed age' ->
          expect(res.age).to.equal void