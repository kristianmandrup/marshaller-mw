requires  = require '../../requires'

requires.test 'test_setup'

assert = require('chai').assert
expect = require('chai').expect

_  = require 'prelude-ls'

Person              = requires.clazz 'person'

PersonMarshaller    = requires.marshaller 'person_marshaller'

# TODO: needs a start file like index.js to be found
DecoratorMw         = require('decorator-mw')

MarshalMw         = requires.lib ('marshaller-mw')
CtxDecorations     = require('decorator-mw').CtxDecorations

middleware = require 'middleware'
Middleware = middleware.Middleware

app =
  decorators: new CtxDecorations


describe 'MarshalMw' ->
  var some-hash, marshallers

  mshal = {}

  describe 'create instance' ->
    context 'no args' ->
      before ->
        mshal.empty = new MarshalMw

      specify 'is created' ->
        expect(mshal.empty).to.not.equal null

      specify 'has marshallers' ->
        expect(mshal.empty.marshallers).to.not.equal null

    context 'with invalid marshallers hash' ->
      before ->
        some-hash = {x: 1}

      specify 'is created' ->
        expect( -> new MarshalMw some-hash).to.throw

    context 'with marshallers hash' ->
      before ->
        marshallers =
          person: PersonMarshaller

      specify 'is created' ->
        expect( -> new MarshalMw marshallers).to.not.throw


  describe 'run' ->
    before ->
      marshallers =
        person: PersonMarshaller

      mshal.valid = new MarshalMw marshallers, mode: 'alone'

    context 'no args' ->
      specify 'is run ok' ->
        expect(-> mshal.valid.run!).to.not.throw

    context 'with valid context' ->
      before ->
        some-hash = {x: 1}

      specify 'is run ok?' ->
        expect(-> mshal.valid.run 'hello', mode: 'alone').to.not.throw
