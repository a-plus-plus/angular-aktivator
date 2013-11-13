'use strict'

angular.module('angularAktivatorApp')
  .controller 'AnswerCtrl', ['$scope', 'Survey', '$routeParams','Response', ($scope, Survey, $routeParams, Response) ->
    $scope.survey = Survey.get(id: $routeParams.id)
    $scope.response = {}

    $scope.clicksubmit = () -> 
        $scope.parsedResponse = {}
        angular.forEach($scope.response,(elem, index) ->
            $scope.parsedResponse[index]=eval("("+elem+")")
        )
        response = 
            response:
                    survey_id:$scope.survey.id
                    answers_attributes:$scope.parsedResponse
                
        
        Response.save(response)
  

  ]
