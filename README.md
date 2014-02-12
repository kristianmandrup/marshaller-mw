# Marshaller Mw

Middleware to serialize object to server (remove or transform certain properties)

## TODO

* Create test suite
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