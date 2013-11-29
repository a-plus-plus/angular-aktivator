'use strict'

angular.module('angularAktivatorApp')
.controller 'SurveyManagerCtrl', ['$scope','Survey', 'RailsFormatter', '$routeParams','Tag','filterFilter', '$location', '$q',($scope, Survey, RailsFormatter, $routeParams,Tag, filterFilter, $location,$q) ->

  id = $routeParams.id

  $scope.survey = if id =='new' then {questions:[], tags:[]} else Survey.get(id:id)

  $scope.tags = Tag.query()

  $q.all([
    $scope.survey.$promise,
    $scope.tags.$promise
  ]).then ()->
    $scope.survey.tags.forEach (elem) ->
      $scope.tags.forEach (elem2) ->
        #console.log 'id1', elem.id, 'id2', elem2.id
        if elem.id == elem2.id
          elem2.selected = true





  # Returns true when creating a new survey and false when editing an existing survey, used by ng-ifs
  $scope.isNew = () ->
    id == 'new'

  redirectToListing = () ->
    $location.path('/surveys')

  $scope.info = (event) ->
    console.log($scope.survey);

  $scope.newQuestion = (event) ->
    event.preventDefault()
    $scope.survey.questions.push({kind:'Radiobutton', options:[]})

  $scope.removeQuestion = (question, event, index, survey) ->
    event.preventDefault()
    if (question.id)
      question._destroy = 1
      console.log 'added field to', question
    else
      survey.questions.splice(index, 1)

  $scope.isSelected = (tag) ->
    tag.selected


  $scope.saveTag = (tag) ->
    $scope.survey.tags.push tag

  $scope.newOption = (event, question) ->
    event.preventDefault()
    question.options.push({})

  $scope.removeOption = (option, event, index, question) ->
    event.preventDefault()
    if question.id
      option._destroy = 1
    else
      question.options.splice(index,1)

  $scope.submit = (survey) ->
    if (survey.id)
      Survey.update id:survey.id, survey, (->
        redirectToListing() #$scope.message = "Survey added!"
        $scope.survey = {questions:[]}
      ), (err) ->
        $scope.message = "Error adding survey: " + err.data.title
    else
      Survey.save survey, (->
        redirectToListing()  #$scope.message = "Survey added!"
        $scope.survey = {question:[]}
      ), (err) ->
        $scope.message = "Error adding survey: " + err.data.title
  ]
