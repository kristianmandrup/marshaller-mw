// Generated by LiveScript 1.2.0
(function(){
  var Class, requires, BaseModel;
  Class = require('jsclass/src/core').Class;
  requires = require('../../../requires');
  BaseModel = new Class({
    initialize: function(obj){
      return _.keys(obj).each(function(key){
        return this[key] = obj[key];
      });
    }
  });
  module.exports = BaseModel;
}).call(this);
