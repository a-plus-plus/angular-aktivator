'use strict'

describe 'Controller: MessagecontrollerCtrl', () ->

  # load the controller's module
  beforeEach module 'angularAktivatorApp'

  messageCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    messageCtrl = $controller 'messageCtrl', {
      $scope: scope
    }

  it 'should attach a list of messages to the scope', () ->
    # scope.$digest()
    expect(scope.messages.length).toBe 0
