// Generated by LiveScript 1.2.0
(function(){
  var Class, Encrypter, Marshaller, PersonMarshaller, slice$ = [].slice;
  Class = require('jsclass/src/core').Class;
  Encrypter = new Class({
    encrypt: function(data){
      return "x-" + data + "-x";
    }
  });
  Marshaller = new Class({
    deleteProperties: function(){
      var names;
      names = slice$.call(arguments);
      return names.flatten.compact.each(function(name){
        var ref$, ref1$;
        return ref1$ = (ref$ = this.data)[name], delete ref$[name], ref1$;
      });
    },
    encrypt: function(value){
      return this.encrypter.encrypt(value);
    },
    encrypter: function(){
      return new Encrypter;
    }
  });
  PersonMarshaller = new Class(Marshaller, {
    intialize: function(data){
      this.data = data;
      return this.callSuper();
    },
    marshal: function(){
      this.encrypt(this.data.password);
      delete this.data.status;
      deleteProperties('age', 'color');
      return this.data;
    }
  });
}).call(this);