# Marshaller Mw

[![Greenkeeper badge](https://badges.greenkeeper.io/kristianmandrup/marshaller-mw.svg)](https://greenkeeper.io/)

Middleware to serialize object to server (remove or transform certain properties)

Works well with other mw-components for the *middleware* project

* [middleware](https://github.com/kristianmandrup/middleware)
* [model-mw](https://github.com/kristianmandrup/model-mw)
* [authorize-mw](https://github.com/kristianmandrup/authorize-mw)
* [validator-mw](https://github.com/kristianmandrup/validator-mw)
* [decorator-mw](https://github.com/kristianmandrup/decorator-mw)
* [racer-mw](https://github.com/kristianmandrup/racer-mw)

## Marshaller

The marshal-mw builds on functionality provided by [decorator-mw](https://github.com/kristianmandrup/decorator-mw).
It similarly allows for marshalling objects differently depending on context. 

*Simple* MW marshal example

```LiveScript
Person = new Class(BaseModel,
  initialize: (obj) ->
    @callSuper!

  fullName: ->
    [@firs-name, @last-name].join ' '
)

PersonMarshaller = new Class(Marshaller,
  marshal: (data) ->
    @call-super!
    if @data.password?
      @data.password = @encrypt @data.password
    delete @data.status
    @delete-properties 'age', 'online'
    @data
)


person =
  name: 'Joe 6 Pack'
  age: 28
  status: 'single'
  clazz: 'person'

# init marshaller with person, then marshal
person-marshaller = new PersonMarshaller person
marshalled-person = person-marshaller.marshal!

# alternative
person-marshaller = new PersonMarshaller
marshalled-person = person-marshaller.marshal person

# result

console.log marshalled-person

=> {
  name: 'Joe 6 Pack'
  clazz: 'person'
}

```

*Advanced* MW marshal example

Using Marshaller Mw-component as part of a middleware stack

```LiveScript
# generic middleware "runner"
Middleware   = require('middleware).Middleware

# load Mw-component classes
MarshallerMw = require('marshaller-mw).Mw

# configure middleware stack to be run
store-mw-stack = new Middleware('model').use(MarshallerMw)

# run mw stack on a "decorated" person
marshal-ready-person = store-mw-stack.run decorated-person
```

Middleware advanced config:

Create mw-stack to:
- authorize storage mutation action (f.ex 'update')
- validate document to be stored (f.ex person)
- marshal person (strip properties not to be stored, encrypt sensitive data etc.)
- save person via Racer sync layer

Note: In the above example, it might sometimes make sense to have two marshalling layers.
One before validation to strip temporal session data such as online status (which should not be validated?) and one before storage
to encrypt passwords and treat sensitive data for storage. The middleware approach grants you the flexibility to insert
these layers in whatever stack layout that you require.

See [middleware](https://github.com/kristianmandrup/middleware)

```LiveScript
MarshallerMw = require('marshaller-mw).Mw
Middleware   = require('middleware).Middleware

# config complete middleware stack for use with updates/creates
store-mw-stack = new Middleware('model').use(authorize-mw).use(validate-mw).use(MarshallerMw).use(RacerMw)
store-mw-stack.run decorated-person
```

See also [decorator-mw](https://github.com/kristianmandrup/decorator-mw)

## Contributing

Easier to use linking when developing multiple packages with inter-dependencies...

* exec `npm link` on local dependent packages such decorator-mw
* then exec `npm link xxxx` in this project to link to local package source

Then whenever you change code in local `decorator-mw` folder, it will be reflected here
since node module `decorator-mw` is now a symbolic link :)

Please continue further development by a Test Driven approach (tests first)

## TODO

* Complete test suite and improve API + DSL

## Testing

Use *mocha* :)

`$ mocha test`

Run particular test

`$ mocha test/marshaller-mw/marshaller-mw_test.js`

Easy :)
