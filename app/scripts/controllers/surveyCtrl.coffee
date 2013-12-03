'use strict'

angular.module('angularAktivatorApp')
.controller 'SurveyCtrl', ['$scope','Survey', 'Tag', 'Session','$route',($scope, Survey, Tag, Session, $route) ->
  $scope.surveys = Survey.query()

  $scope.tags = Tag.query()
  $scope.tag = {}
  $scope.message = ""

    $scope.tagList = []
    $scope.surveyIdList = []

  $scope.addTag = (tag) ->
    found = false
    for Tag in $scope.tagList
      if tag.id == Tag.id
        found = true
    if !found
      $scope.tagList.push(tag)

            # hae kaikki surveyt functiolla ja pistä ne joihin viitataan surveyIdListassa niin
            # pistä ne omaan listaan ja hae niitä ng-repeat
    $scope.deleteChoice = (index) -> 
        $scope.tagList.splice(index,1)

  
    $scope.total = ->
        $scope.tagList.length

    

  $scope.destroy = (survey) ->
    Survey.delete id:survey.id, -> $route.reload()

    $scope.tagFilter = (tag) ->
        found = false
        for id in $scope.surveyIdList
            if tag.surveys[0].survey_id == id
                found = true
        if !found
            $scope.surveyIdList.push(tag.surveys[0].survey_id)


  $scope.isLogged = ->
    Session.isLogged()

]
