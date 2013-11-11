'use strict'

angular.module('angularAktivatorApp')
  .controller 'AnswerCtrl', ['$scope', 'Survey', '$routeParams','Response', ($scope, Survey, $routeParams, Response) ->
    $scope.surveys = Survey.query()
    $scope.survey = Survey.get(id: $routeParams.id)
    $scope.response = {survey_id:1, answers_attributes:{}}
    $scope.paina = () ->
    	$scope.count++
    	console.log ("toimii!")
    	Response.save($scope.response)


  ]
