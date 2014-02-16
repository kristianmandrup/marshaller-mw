require 'sugar'

_   = require 'prelude-ls'

underscore = (...items) ->
  items = items.flatten!
  strings = items.map (item) ->
    String(item)
  _.map (.underscore!), strings

full-path = (base, ...paths) ->
  upaths = underscore(...paths)
  ['.', base, upaths].flatten!.join '/'

test-path = (...paths) ->
  full-path 'test', ...paths

marshaller-path = (...paths) ->
  full-path 'marshallers', ...paths

module.exports =
  test: (...paths) ->
    require test-path(...paths)

  marshaller: (...paths) ->
    @fixture 'marshallers', paths

  clazz: (...paths) ->
    @fixture 'classes', paths

  fixture: (...paths) ->
    @test 'fixtures', paths

  file: (...paths) ->
    require full-path('.', ...paths)

  lib: (...paths) ->
    @file 'lib', ...paths

  util: (...paths) ->
    @lib 'util', ...paths

  # m - alias for module
  m: (path) ->
    @file path

  files: (...paths) ->
    paths.flatten!.map (path) ->
      @file path

  fixtures: (...paths) ->
    paths.flatten!.map (path) ->
      @fixture path

  tests: (...paths) ->
    paths.flatten!.map (path) ->
      @test path