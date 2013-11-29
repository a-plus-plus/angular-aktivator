'use strict'
describe 'SurveyCtrl', () ->

  # load the controller's module
  beforeEach module 'angularAktivatorApp'

  SurveyCtrl = {}
  scope = {}
  backend = undefined

  # Initialize the controller and create mocks
  beforeEach inject ($controller, $rootScope, $httpBackend) ->
    scope = $rootScope.$new()
    SurveyCtrl = $controller 'SurveyCtrl', {
      $scope: scope
    }
    backend = $httpBackend
    backend.expectGET('http://localhost:3000/surveys').respond([{title:'Hei ihminen', id:1}])
    backend.expectGET('http://localhost:3000/tags').respond([{title:'Matematiikka', id:1}, {title:'Tietojenkäsittely', id:2}])


  afterEach ->
    backend.verifyNoOutstandingExpectation()
    backend.verifyNoOutstandingRequest()



#   crashing "Unexpected request GET: ..." which is actually to be expected
  it 'should attach a list of surveys to scope', () ->
    expect(Array.isArray(scope.surveys)).toBe true
    #expect(scope.surveys.length).toBe 1
    backend.flush()
    expect(scope.surveys.length).toBe 1
  it 'should attach a list of tags to scope',  ->
    backend.flush()
    expect(scope.tags.length).toBe 2
