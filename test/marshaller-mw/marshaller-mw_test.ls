rek       = require 'rekuire'
requires  = rek 'requires'

requires.test 'test_setup'

assert = require('chai').assert
expect = require('chai').expect

_  = require 'prelude-ls'

Person              = requires.clazz 'person'

# TODO: needs a start file like index.js to be found
DecoratorMw         = require('decorator-mw')

MarshallerMw        = require('marshaller-mw')
ContextDecorators   = require('decorate-mw').ContextDecorators

middleware = require 'middleware'
Middleware = middleware.Middleware

load-mw-stack = new Middleware('model').use(decorate: DecoratorMw)

app =
  decorators: new ContextDecorators

# should be a global repo
app.decorators.set 'person', Person

person =
  name: 'Joe 6 Pack'
  age: 28
  clazz: 'person' # important!

load-mw-stack = new Middleware('model').use(DecorateMw)

# find and instantiate model class via clazz attribute (= 'person')
decorated-person = load-mw-stack.run person

store-mw-stack = new Middleware('model').use(MarshallerMw)
store-mw-stack.run decorated-person

model-mw = requires.file 'index'

ModelMw       = model-mw.mw
ModelRunner   = model-mw.runner

Middleware    = require('middleware').Middleware

describe MarshallerMw ->
  var some-hash, marshallers

  mshal = {}

  describe 'create instance' ->
    context 'no args' ->
      specify 'is created' ->
        expect(new MarshallerMw.constructor).to.eql MarshallerMw

    context 'with invalid marshallers hash' ->
      before ->
        some-hash = {x: 1}

      specify 'is created' ->
        expect( -> new MarshallerMw some-hash).to.throw

    context 'with marshallers hash' ->
      before ->
        marshallers =
          person: PersonMarshaller

      specify 'is created' ->
        expect( -> new MarshallerMw marshallers).to.not.throw


  describe 'run' ->
    before ->
      marshallers =
        person: PersonMarshaller

      mshal.valid = new MarshallerMw marshallers

    context 'no args' ->
      specify 'is run ok' ->
        expect(mshal.valid.run!).to.not.throw

    context 'with valid context' ->
      before ->
        some-hash = {x: 1}

      specify 'is run ok?' ->
        expect(mshal.valid.run 'hello').to.not.throw
