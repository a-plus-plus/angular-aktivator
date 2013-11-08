'use strict'

angular.module('angularAktivatorApp')
  .controller 'AnswerCtrl', ['$scope', 'Survey', '$routeParams', ($scope, Survey, $routeParams) ->
    $scope.surveys = Survey.query()
    $scope.survey = Survey.get(id: $routeParams.id)
    $scope.paina = () ->
    	$scope.count++
    	console.log ("toimii!")


  ]
