# Marshaller Mw

Middleware to serialize object to server (remove or transform certain properties)

## TODO

* Complete test suite
* Rename to MarshalMw ??

## Marshaller

Create mw-stack to authorize storage mutation action, then validate state, then marshal

```LiveScript
store-mw-stack = new Middleware('model').use(MarshallerMw)
store-mw-stack.run decorated-person
```

or more advanced config

```LiveScript
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

## Testing

Use *mocha* :)

`$ mocha test`

Run particular test

`$ mocha test/marshaller-mw/marshaller-mw_test.js`

Easy :)