'use strict'

angular.module('angularAktivatorApp')
.controller 'SurveyCtrl', ['$scope','Survey', 'Tag', 'Session','$route',($scope, Survey, Tag, Session, $route) ->
  $scope.surveys = Survey.query()

  $scope.tags = Tag.query()

  $scope.tagList = []


  $scope.color = (i) ->
    colors = ['info', 'success', 'warning', 'important', 'error', 'inverse']
    colors[i % colors.length]


  $scope.removeTagFromFilter = (index) ->
    $scope.tagList.splice(index,1)



  $scope.addTagToFilter = (title) ->
    tag = findBy('title',$scope.tags, title)
    if tag
      if !findBy('title', $scope.tagList,tag.title)
        $scope.tagList.push(tag)
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

  $scope.tagFilter = (survey) ->
    return true if $scope.tagList.length is 0
    found = false
    angular.forEach($scope.tagList, (tag, i) ->
      angular.forEach(tag.surveys, (s, i) ->
        if (survey.id == s.survey_id)
          found = true
      )
    )
    found

  $scope.myOwn = (survey) ->
    if $scope.onlyOwn
      survey.isMy
    else
      true

  $scope.total = ->
    $scope.tagList.length



  $scope.destroy = (survey) ->
    Survey.delete id:survey.id, -> $route.reload()



  $scope.isLogged = ->
    Session.isLogged()

]
