'use strict'

describe 'Directive: autocomplete', () ->

  # load the directive's module
  beforeEach module 'angularAktivatorApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  # it 'should make hidden element visible', inject ($compile) ->
  #   element = angular.element '<autocomplete></autocomplete>'
  #   element = $compile(element) scope
