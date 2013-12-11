'use strict'
describe 'SurveyCtrl', () ->

  # load the controller's module
  beforeEach module 'angularAktivatorApp'

  SurveyCtrl = {}
  scope = {}
  backend = undefined
  route = {}

  # Initialize the controller and create mocks
  beforeEach inject ($controller, $rootScope, $httpBackend, databaseUrl) ->
    scope = $rootScope.$new()
    SurveyCtrl = $controller 'SurveyCtrl', {
      $scope: scope
      $route: route
    }
    backend = $httpBackend
    backend.expectGET(databaseUrl+'/surveys').respond([{title:'Hei ihminen', id:1}])
    backend.expectGET(databaseUrl+'/tags').respond([{title:'Matematiikka', id:1}, {title:'Tietojenkäsittely', id:2}])


  afterEach ->
    backend.verifyNoOutstandingExpectation()
    backend.verifyNoOutstandingRequest()

  it 'should attach a list of surveys to scope', () ->
    expect(Array.isArray(scope.surveys)).toBe true
    backend.flush()
    expect(scope.surveys.length).toBe 1

  it 'should attach a list of tags to scope',  ->
    backend.flush()
    expect(scope.tags.length).toBe 2
