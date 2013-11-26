'use strict'

angular.module('angularAktivatorApp')
  .controller 'ResultsCtrl', ['$scope','Results', '$rootScope','$routeParams', ($scope, Results, $rootScope, $routeParams) ->
    $scope.result = Results.get(id: $routeParams.id)

    # Checks whether $rootScope has a responseSuccessMessage, and, if it does, gives that as a string to $scope.message
    
  ]
