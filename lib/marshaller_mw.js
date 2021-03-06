// Generated by LiveScript 1.2.0
(function(){
  var ModelMw, ContextDecorations, MarshallerMw;
  ModelMw = require('model-mw').mw;
  ContextDecorations = require('decorator-mw').ContextDecorations;
  module.exports = MarshallerMw = (function(superclass){
    var prototype = extend$((import$(MarshallerMw, superclass).displayName = 'MarshallerMw', MarshallerMw), superclass).prototype, constructor = MarshallerMw;
    function MarshallerMw(context){
      this.context = context;
      MarshallerMw.superclass.apply(this, arguments);
      this.marshallers = this.context.marshallers != null
        ? createMarshallers(this.context.marshallers)
        : this.appMarshallers();
    }
    prototype.appMarshallers = function(){
      if (typeof app === 'object') {
        return app.marshallers;
      }
    };
    prototype.createMarshallers = function(context){
      return new ContextMarshallers(context);
    };
    prototype.run = function(ctx){
      var ctxMarshaller;
      superclass.prototype.run.apply(this, arguments);
      ctxMarshaller = this.marshallers.ctx(this.context);
      return ctxMarshaller.marshal(this.data, this.model);
    };
    return MarshallerMw;
  }(ModelMw));
  function extend$(sub, sup){
    function fun(){} fun.prototype = (sub.superclass = sup).prototype;
    (sub.prototype = new fun).constructor = sub;
    if (typeof sup.extended == 'function') sup.extended(sub);
    return sub;
  }
  function import$(obj, src){
    var own = {}.hasOwnProperty;
    for (var key in src) if (own.call(src, key)) obj[key] = src[key];
    return obj;
  }
}).call(this);
