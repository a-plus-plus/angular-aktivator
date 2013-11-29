'use strict'

angular.module('angularAktivatorApp')
.controller 'SurveyCtrl', ['$scope','Survey',($scope, Survey) ->
  $scope.surveys = Survey.query()

  $scope.destroy = (survey) ->
    Survey.delete id:survey.id
]
