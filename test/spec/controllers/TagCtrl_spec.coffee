'use strict'

describe 'Controller: TagCtrl', () ->

  # load the controller's module
  beforeEach module 'angularAktivatorApp'

  TagCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    TagCtrl = $controller 'TagCtrl', {
      $scope: scope
    }

  # it 'should attach a list of awesomeThings to the scope', () ->
  #   expect(scope.awesomeThings.length).toBe 3
