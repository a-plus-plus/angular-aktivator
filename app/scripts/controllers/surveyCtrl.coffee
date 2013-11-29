'use strict'

angular.module('angularAktivatorApp')
.controller 'SurveyCtrl', ['$scope','Survey', 'Tag', ($scope, Survey, Tag) ->
    $scope.surveys = Survey.query()

    $scope.tags = Tag.query()
    $scope.tag = {}
    $scope.message = ""

    $scope.tagList = []

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
        Survey.delete id:survey.id
        console.log "deleted, reload page"

    ]
