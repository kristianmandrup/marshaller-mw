ModelMw = require('model-mw').mw
ContextDecorations = require('decorator-mw').ContextDecorations

module.exports = class MarshallerMw extends ModelMw
  (@context) ->
    super ...
    @marshallers = if @context.marshallers? then create-marshallers(@context.marshallers) else @app-marshallers!

  app-marshallers: ->
    if typeof app is 'object'
      app.marshallers

  create-marshallers: (context) ->
    new ContextMarshallers context

  # lookup context
  # find decoration based on klass and context
  # model will be set by inherited ModelMw
  # it should detect the clazz attribute of incoming data and
  # set model (singular) and collection (plural), using inflection
  run: (ctx) ->
    super ...

    # See DecoratorMw run method :)
    ctx-marshaller = @marshallers.ctx @context
    ctx-marshaller.marshal @data, @model