# Marshaller Mw

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

Simple MW marshal example

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

More Middleware advanced config

Create mw-stack to:
- authorize storage mutation action (f.ex 'update')
- validate document to be stored (f.ex person)
- marshal person (strip properties not to be stored, encrypt sensitive data etc.)
- save person via Racer sync layer

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
