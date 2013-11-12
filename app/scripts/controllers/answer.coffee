'use strict'

angular.module('angularAktivatorApp')
  .controller 'AnswerCtrl', ['$scope', 'Survey', '$routeParams','Response', ($scope, Survey, $routeParams, Response) ->
    $scope.survey = Survey.get(id: $routeParams.id)
    $scope.response = []
    $scope.paina = () ->
    	Response.save($scope.response)


  ]
