'use strict'

describe 'Controller: ResultsCtrl', () ->
  ResultsCtrl = scope = Results = Survey = null

  # load the controller's module
  beforeEach module 'angularAktivatorApp'

  ResultsCtrl = {}
  scope = {}

  module ($provide) ->
   $provide.value 'Survey', new MockSurvey()
   $provide.value 'Results', new MockResults()
   null

  # Initialize the controller and a mock scope $scope, Results, $rootScope, $routeParams, Survey
  beforeEach inject ($controller, _Results_, $rootScope, $routeParams, _Survey_) ->
    scope = {} # $rootScope.$new()
    Results = _Results_
    Survey = _Survey_
    ResultsCtrl = $controller 'ResultsCtrl', {
      $scope: scope
    }

  beforeEach ->
    Survey.get = jasmine.createSpy('get')
    Results.get = jasmine.createSpy('get')

  it 'should exist', ->
    expect(!!ResultsCtrl).toBe true

  it 'should define a result property', ->
    expect(scope.result).toBeDefined()

  it 'should define a survey property', ->
    expect(scope.survey).toBeDefined()

  # it 'should call Survey', ->
  #   expect(Survey.get.callCount).toBe(1)
  #   expect(Survey.get).toHaveBeenCalledWith(id: $routeParams.id)

  # it 'should call Results', ->
  #   expect(Results.get.callCount).toBe(1)
  #   expect(Results.get).toHaveBeenCalledWith(id: $routeParams.id)
