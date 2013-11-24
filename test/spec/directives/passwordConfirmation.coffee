'use strict'

describe 'Directive: passwordConfirmation', () ->

  # load the directive's module
  beforeEach module 'angularAktivatorApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<password-confirmation></password-confirmation>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the passwordConfirmation directive'
