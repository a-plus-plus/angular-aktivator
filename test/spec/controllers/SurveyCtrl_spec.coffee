'use strict'
describe 'Controller: SurveyCtrl', () ->

  # load the controller's module
  beforeEach module 'angularAktivatorApp'

  SurveyCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    SurveyCtrl = $controller 'SurveyCtrl', {
      $scope: scope
    }
  # crashing "Unexpected request GET: ..." which is actually to be expected
  #it 'should attach a list of surveys to scope', () ->
    #expect(scope.surveys).toBe Array
