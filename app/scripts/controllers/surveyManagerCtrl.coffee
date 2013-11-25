'use strict'

angular.module('angularAktivatorApp')
.controller 'SurveyManagerCtrl', ['$scope','Survey', 'RailsFormatter', '$routeParams','Tag','filterFilter', '$location', ($scope, Survey, RailsFormatter, $routeParams,Tag, filterFilter, $location) ->
  


  setTagIds = () ->
    console.log 'ASDASDASDASD',$scope.survey, $scope.tags
    if ! $scope.survey.tags or ! $scope.tags
      return
    console.log $scope.survey.tags , $scope.tags
    $scope.survey.tags.forEach (elem) ->
      $scope.tags.forEach (elem2) ->
        if elem.id == elem2.id
          elem2.selected = true
          console.log 'was true'

  id = $routeParams.id
  console.log id
  $scope.survey = if id =='new' then {questions:[]} else Survey.get(id:id, setTagIds)
  $scope.tags = Tag.query(setTagIds)

  


  
  # Returns true when creating a new survey and false when editing an existing survey, used by ng-ifs
  $scope.isNew = () ->
    if id == 'new'
      true
    else
      false

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
    else
      survey.questions.splice(index, 1)

  $scope.isSelected = () ->
    

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

  $scope.test = (event, survey) ->
    console.log(survey)

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
