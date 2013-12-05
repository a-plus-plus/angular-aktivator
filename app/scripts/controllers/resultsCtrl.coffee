'use strict'

angular.module('angularAktivatorApp')
  .controller 'ResultsCtrl', ['$scope','Results', '$routeParams', 'Survey', ($scope, Results, $routeParams, Survey) ->
    Results.get(id: $routeParams.id, (data, response) ->
     $scope.result = data
     )

    $scope.startChart = (question) ->
      console.log question
      chartConfig =
        options:
          chart:
            type: "pie"

        series: []
        title:
          text: question.title

        loading: false

      values = []
      for n in question.options
        console.log n.value
        values.push [n.value, n.count]

      chartConfig.series.push data: values
      chartConfig

  ]
