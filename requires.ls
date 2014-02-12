require 'sugar'

rek = require 'rekuire'
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
    @fixtures 'marshallers', paths

  clazz: (...paths) ->
    @fixture 'classes', paths

  fixture: (...paths) ->
    @test 'fixtures', paths

  file: (path) ->
    require full-path('.', path)

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