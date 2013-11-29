'use strict'
describe 'Controller: SurveyCtrl', () ->

  # load the controller's module
  beforeEach module 'angularAktivatorApp'

  SurveyCtrl = {}
  scope = {}
  $httpBackend = undefined

  # Initialize the controller and create mocks
  beforeEach inject ($controller, $rootScope, $injector) ->
    scope = $rootScope.$new()
    SurveyCtrl = $controller 'SurveyCtrl', {
      $scope: scope
    }
    $httpBackend = $injector.get('$httpBackend')
    $httpBackend.expectGET('http://localhost:3000/surveys').respond([{title:'Hei ihminen', id:1}])
    $httpBackend.expectGET('http://localhost:3000/tags').respond([{title:'Matematiikka', id:1}])

  afterEach ->
    $httpBackend.verifyNoOutstandingExpectation()
    $httpBackend.verifyNoOutstandingRequest()



#   crashing "Unexpected request GET: ..." which is actually to be expected
  it 'should attach a list of surveys to scope', () ->
    expect(Array.isArray(scope.surveys)).toBe true
    #expect(scope.surveys.length).toBe 1
    $httpBackend.flush()
    expect(scope.surveys.length).toBe 1
