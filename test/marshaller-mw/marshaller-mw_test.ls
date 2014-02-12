Person              = requires.claszz 'person'
DecorateMw          = require('decorate-mw')
MarshallerMw        = require('marshaller-mw')
ContextDecorators   = require('decorate-mw').ContextDecorators

middleware = require 'middleware'
Middleware = middleware.Middleware

load-mw-stack = new Middleware('model').use(decorate: DecorateMw)

app ||=

app.decorators = new ContextDecorators

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
