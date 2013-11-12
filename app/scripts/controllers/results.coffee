'use strict'

angular.module('angularAktivatorApp')
  .controller 'ResultsCtrl', ['$scope','Results', ($scope, Results) ->
    $scope.results = Results.query()
  ]
