'use strict'

describe 'Controller: ResultsCtrl', () ->

  # load the controller's module
  beforeEach module 'angularAktivatorApp'

  ResultsCtrl = {}
  scope = {}
  Results = {}
  Survey = {}

  module ($provide) ->
    $provide.value 'Survey', new MockSurvey()
    $provide.value 'Results', new MockResults()
    null

  # Initialize the controller and a mock scope $scope, Results, $rootScope, $routeParams, Survey
  beforeEach inject ($controller, $routeParams, _Results_, _Survey_, $rootScope) ->
    scope = $rootScope.$new()
    Survey = _Survey_
    Results = _Results_
    console.log Survey

    routeParams = {id:1}
    ResultsCtrl = $controller 'ResultsCtrl', {
      $scope: scope
      $routeParams: routeParams
    }

  beforeEach ->
    Survey.get = jasmine.createSpy('get')
    Results.get = jasmine.createSpy('get')



  it 'should exist', ->
    expect(!!ResultsCtrl).toBe true

  it 'should define a result property', ->
    expect(scope.result).toBeDefined()

  # it 'should define a survey property', ->
  #   expect(scope.survey).toBeDefined()

  # it 'should call Survey', ->
  #   scope.$digest()
  #   expect(Survey.get.callCount).toBe(1)
  #   expect(Survey.get).toHaveBeenCalledWith({id:1})

  # it 'should call Results', ->
  #   expect(Results.get.callCount).toBe(1)
  #   expect(Results.get).toHaveBeenCalledWith({id:1})
