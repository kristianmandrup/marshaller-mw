// Generated by LiveScript 1.2.0
(function(){
  var rek, requires, assert, expect, _, Person, DecorateMw, MarshallerMw, ContextDecorators, middleware, Middleware, loadMwStack, app, person, decoratedPerson, storeMwStack, modelMw, ModelMw, ModelRunner;
  rek = require('rekuire');
  requires = rek('requires');
  requires.test('test_setup');
  assert = require('chai').assert;
  expect = require('chai').expect;
  _ = require('prelude-ls');
  Person = requires.claszz('person');
  DecorateMw = require('decorate-mw');
  MarshallerMw = require('marshaller-mw');
  ContextDecorators = require('decorate-mw').ContextDecorators;
  middleware = require('middleware');
  Middleware = middleware.Middleware;
  loadMwStack = new Middleware('model').use({
    decorate: DecorateMw
  });
  app = {
    decorators: new ContextDecorators
  };
  app.decorators.set('person', Person);
  person = {
    name: 'Joe 6 Pack',
    age: 28,
    clazz: 'person'
  };
  loadMwStack = new Middleware('model').use(DecorateMw);
  decoratedPerson = loadMwStack.run(person);
  storeMwStack = new Middleware('model').use(MarshallerMw);
  storeMwStack.run(decoratedPerson);
  modelMw = requires.file('index');
  ModelMw = modelMw.mw;
  ModelRunner = modelMw.runner;
  Middleware = require('middleware').Middleware;
  describe(MarshallerMw(function(){
    var someHash, marshallers, mshal;
    mshal = {};
    describe('create instance', function(){
      context('no args', function(){
        return specify('is created', function(){
          return expect(new MarshallerMw.constructor).to.eql(MarshallerMw);
        });
      });
      context('with invalid marshallers hash', function(){
        before(function(){
          var someHash;
          return someHash = {
            x: 1
          };
        });
        return specify('is created', function(){
          return expect(function(){
            return new MarshallerMw(someHash);
          }).to['throw'];
        });
      });
      return context('with marshallers hash', function(){
        before(function(){
          var marshallers;
          return marshallers = {
            person: PersonMarshaller
          };
        });
        return specify('is created', function(){
          return expect(function(){
            return new MarshallerMw(marshallers);
          }).to.not['throw'];
        });
      });
    });
    return describe('run', function(){
      before(function(){
        var marshallers;
        marshallers = {
          person: PersonMarshaller
        };
        return mshal.valid = new MarshallerMw(marshallers);
      });
      context('no args', function(){
        return specify('is run ok', function(){
          return expect(mshal.valid.run()).to.not['throw'];
        });
      });
      return context('with valid context', function(){
        before(function(){
          var someHash;
          return someHash = {
            x: 1
          };
        });
        return specify('is run ok?', function(){
          return expect(mshal.valid.run('hello')).to.not['throw'];
        });
      });
    });
  }));
}).call(this);
