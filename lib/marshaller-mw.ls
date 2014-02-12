ModelMw = require('model-mw').ModelMw
ContextDecorations = require('decorator-mw').ContextDecorations

module.exports = class MarshallerMw extends ModelMw
  (@context) ->
    super ...
    @marshallers = if @context.marshallers? then create-marshallers(@context.marshallers) else app.marshallers

  create-marshallers: (context) ->
    new ContextDecorations context

  # lookup context
  # find decoration based on klass and context
  # model will be set by inherited ModelMw
  # it should detect the clazz attribute of incoming data and
  # set model (singular) and collection (plural), using inflection
  run: (ctx) ->
    super ...
    klass = @marshallers.get @context, @model
    new klass(@data).marshal!