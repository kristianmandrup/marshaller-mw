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

store-mw-stack = new Middleware('model').use(MarshalMw)
store-mw-stack.run decorated-person

model-mw = requires.file 'index'

ModelMw       = model-mw.mw
ModelRunner   = model-mw.runner

Middleware    = require('middleware').Middleware