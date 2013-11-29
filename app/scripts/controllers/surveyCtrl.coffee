'use strict'

angular.module('angularAktivatorApp')
.controller 'SurveyCtrl', ['$scope','Survey', 'Tag', ($scope, Survey, Tag) ->
    $scope.surveys = Survey.query()

    $scope.tags = Tag.query()
    $scope.tag = {}
    $scope.message = ""

    $scope.tagList = []

    $scope.addTag = (tag) ->
        $scope.tagList.push(tag)
          

    ]
