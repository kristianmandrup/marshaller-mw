// Generated by LiveScript 1.2.0
(function(){
  var rek, _, underscore, fullPath, testPath, marshallerPath, slice$ = [].slice;
  require('sugar');
  rek = require('rekuire');
  _ = require('prelude-ls');
  underscore = function(){
    var items, strings;
    items = slice$.call(arguments);
    items = items.flatten();
    strings = items.map(function(item){
      return String(item);
    });
    return _.map(function(it){
      return it.underscore();
    }, strings);
  };
  fullPath = function(base){
    var paths, upaths;
    paths = slice$.call(arguments, 1);
    upaths = underscore.apply(null, paths);
    return ['.', base, upaths].flatten().join('/');
  };
  testPath = function(){
    var paths;
    paths = slice$.call(arguments);
    return fullPath.apply(null, ['test'].concat(slice$.call(paths)));
  };
  marshallerPath = function(){
    var paths;
    paths = slice$.call(arguments);
    return fullPath.apply(null, ['marshallers'].concat(slice$.call(paths)));
  };
  module.exports = {
    test: function(){
      var paths;
      paths = slice$.call(arguments);
      return require(testPath.apply(null, paths));
    },
    marshaller: function(){
      var paths;
      paths = slice$.call(arguments);
      return this.fixtures('marshallers', paths);
    },
    clazz: function(){
      var paths;
      paths = slice$.call(arguments);
      return this.fixture('classes', paths);
    },
    fixture: function(){
      var paths;
      paths = slice$.call(arguments);
      return this.test('fixtures', paths);
    },
    file: function(path){
      return require(fullPath('.', path));
    },
    m: function(path){
      return this.file(path);
    },
    files: function(){
      var paths;
      paths = slice$.call(arguments);
      return paths.flatten().map(function(path){
        return this.file(path);
      });
    },
    fixtures: function(){
      var paths;
      paths = slice$.call(arguments);
      return paths.flatten().map(function(path){
        return this.fixture(path);
      });
    },
    tests: function(){
      var paths;
      paths = slice$.call(arguments);
      return paths.flatten().map(function(path){
        return this.test(path);
      });
    }
  };
}).call(this);
