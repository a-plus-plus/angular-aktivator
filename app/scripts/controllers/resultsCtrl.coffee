'use strict'

angular.module('angularAktivatorApp')
  .controller 'ResultsCtrl', ['$scope','Results', '$rootScope','$routeParams', 'Survey', ($scope, Results, $rootScope, $routeParams, Survey) ->
    $scope.result = Results.get(id: $routeParams.id)
    $scope.survey = Survey.get(id: $routeParams.id)

    console.log("results ctrl kk")
    console.log($routeParams)
    console.log($rootScope)
    console.log($scope)

    # Checks whether $rootScope has a responseSuccessMessage, and, if it does, gives that as a string to $scope.message

    $scope.MyChart = {
        width : 500,
        height : 500,
        options : {},
        data : [
            {
              value: 30,
              color:"#F7464A"
            },
            {
              value : 50,
              color : "#E2EAE9"
            },
            {
              value : 100,
              color : "#D4CCC5"
            },
            {
              value : 40,
              color : "#949FB1"
            },
            {
              value : 120,
              color : "#4D5360"
            }

        ]
    }

  ]
