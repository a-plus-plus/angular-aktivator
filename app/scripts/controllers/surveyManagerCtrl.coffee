'use strict'

angular.module('angularAktivatorApp')
.controller 'SurveyManagerCtrl', ['$scope','Survey', 'RailsFormatter', '$routeParams','Tag', '$location', '$q',($scope, Survey, RailsFormatter, $routeParams,Tag, $location,$q) ->

  id = $routeParams.id

  $scope.survey = if id =='new' then {questions:[], tags:[]} else Survey.get(id:id)

  $scope.tags = Tag.query()

  # Returns true when creating a new survey and false when editing an existing survey, used by ng-ifs
  $scope.isNew = () ->
    id == 'new'

  $scope.color = (i) ->
    colors = ['info', 'success', 'warning', 'important', 'error', 'inverse']
    colors[i % colors.length]

  redirectToListing = () ->
    $location.path('/')

  $scope.newQuestion = (event) ->
    event.preventDefault()
    $scope.survey.questions.push({kind:'Radiobutton', options:[]})

  $scope.removeQuestion = (question, event, index, survey) ->
    event.preventDefault()
    if question.id
      question._destroy = 1
    else
      survey.questions.splice(index, 1)

  $scope.removeTag = (i) ->
    $scope.survey.tags.splice(i,1)

  $scope.addTag = (title) ->
    console.log title
    tag = findBy('title',$scope.tags, title)
    if tag
      if !findBy('title', $scope.survey.tags,tag.title)
        $scope.survey.tags.push(tag)
    else if confirm('No such tag, create one?')
      Tag.save({title:title}).$promise.then (tag)->
        $scope.tags.push tag
        $scope.survey.tags.push tag
    else
      return
    $scope.tag = ''


  findBy = (key, arr, comp) ->
    if !comp
      return false

    found = undefined
    angular.forEach arr, (elem, i)->
      if elem[key]==comp
        found = elem
    found

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
