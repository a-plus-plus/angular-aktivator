'use strict'

describe 'Controller: SurveymanagerCtrl', () ->

  # load the controller's module
  beforeEach module 'angularAktivatorApp'

  SurveymanagerCtrl = {}
  scope = {}
  backend = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope, $httpBackend) ->
    scope = $rootScope.$new()
    routeParams = {id:1}
    SurveymanagerCtrl = $controller 'SurveyManagerCtrl', {
      $scope: scope
      $routeParams: routeParams
    }
    backend = $httpBackend


  afterEach ->
    backend.verifyNoOutstandingExpectation()
    backend.verifyNoOutstandingRequest()


  it 'makes the corresponding request',->
    backend.expectGET('http://localhost:3000/surveys/1').respond({title: 'Joku kysely', questions: [{title: 'Onko kivaa?'}], id: 1, tags: [{}]})
    backend.expectGET('http://localhost:3000/tags').respond([{title: 'Vektorit'}])
    backend.flush()

  it 'matches the corresponding tags with selected attribute', ->
    backend.expectGET('http://localhost:3000/surveys/1').respond({title: 'Joku kysely', questions: [{title: 'Onko kivaa?'}], id: 1, tags: [{title:'Vektorit', id:1}]})
    backend.expectGET('http://localhost:3000/tags').respond([{title: 'Vektorit', id:1}])
    backend.flush()
    expect(Array.isArray(scope.tags)).toBe true
    expect(scope.tags.length).toBe 1
    expect(scope.tags[0].selected).toBe true

  it 'matches only the corresponding tags with selected attribute and keeps the not corresponding in the array', ->
    backend.expectGET('http://localhost:3000/surveys/1').respond({title: 'Joku kysely', questions: [{title: 'Onko kivaa?'}], id: 1, tags: [{title:'Vektorit', id:1}]})
    backend.expectGET('http://localhost:3000/tags').respond([{title: 'Vektorit', id:1}, {title:'Matriisit', id:2}])
    backend.flush()
    expect(Array.isArray(scope.tags)).toBe true
    expect(scope.tags.length).toBe 2
    expect(scope.tags[0].selected).toBe true
    expect(scope.tags[1].selected).toBe undefined

  it 'removes question with removeQuestion method', ->
    backend.expectGET('http://localhost:3000/surveys/1').respond({title: 'Joku kysely', questions: [{title: 'Onko kivaa?', id:1}], id: 1, tags: [{}]})
    backend.expectGET('http://localhost:3000/tags').respond([{title: 'Vektorit'}])
    backend.flush()
    scope.removeQuestion(scope.survey.questions[0], {preventDefault:->}, 0, scope.survey)
    expect(Array.isArray(scope.survey.questions)).toBe true
    expect(scope.survey.questions[0]['_destroy']).toBe 1
