'use strict'

describe 'Controller: MessagecontrollerCtrl', () ->

  # load the controller's module
  beforeEach module 'angularAktivatorApp'

  MessagecontrollerCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MessagecontrollerCtrl = $controller 'MessagecontrollerCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
