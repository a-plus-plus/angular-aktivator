'use strict'

describe 'Controller: NavigationCtrl', () ->

  # load the controller's module
  beforeEach module 'angularAktivatorApp'

  NavigationCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    NavigationCtrl = $controller 'NavigationCtrl', {
      $scope: scope
    }

  it 'should attach a list of navigation links to scope', () ->
    expect(scope.links.length).toBe 3
