# Decorator Mw

Middleware to serialize object to server

## TODO

Add *requires* and *debugger*

Create test suite

## Marshaller

Create mw-stack to authorize storage mutation action, then validate state, then marshal

```LiveScript
store-mw-stack = new Middleware('model').use(authorize-mw).use(validate-mw).use(MarshallerMw)
store-mw-stack.run decorated-person
```

See also *decorator-mw* project