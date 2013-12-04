'use strict'

angular.module('angularAktivatorApp')
.controller 'SurveyCtrl', ['$scope','Survey', 'Tag', 'Session','$route',($scope, Survey, Tag, Session, $route) ->
  $scope.surveys = Survey.query()

  $scope.tags = Tag.query()
  $scope.tag = {}
  $scope.message = ""

  $scope.tagList = []
  $scope.surveyIdList = []

  $scope.$watchCollection 'tagList', (tagList, oldList)->
    $scope.surveyIdList = []
    angular.forEach tagList, (tag, i) ->
      angular.forEach tag.surveys, (survey, i) ->
        if $scope.surveyIdList.indexOf(survey.survey_id)== -1
          $scope.surveyIdList.push(survey.survey_id)

  $scope.myFilter = (survey) ->
    return true if $scope.tagList.length is 0
    $scope.surveyIdList.indexOf(survey.id) != -1

  $scope.addTag = (tag) ->
    found = false
    for Tag in $scope.tagList
      if tag.id == Tag.id
        found = true
    if !found
      $scope.tagList.push(tag)


  $scope.deleteChoice = (index) -> 
    $scope.tagList.splice(index,1)

  
  $scope.total = ->
    $scope.tagList.length

    

  $scope.destroy = (survey) ->
    Survey.delete id:survey.id, -> $route.reload()

  

  $scope.isLogged = ->
    Session.isLogged()

]
