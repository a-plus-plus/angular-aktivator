'use strict'

angular.module('angularAktivatorApp')
  .controller 'ResultsCtrl', ['$scope','Results', '$routeParams', 'Survey', ($scope, Results, $routeParams, Survey) ->
    $scope.result = Results.get(id: $routeParams.id)
    $scope.survey = Survey.get(id: $routeParams.id)

    $scope.result.$promise.then (obj) ->
      angular.forEach($scope.result.questions, (question, i) ->
        question.config = startChart(question)
      )

    startChart = (question) ->
      chartConfig =
        options:
          chart:
            type: "pie"
            backgroundColor: "#fafafa"
          plotOptions:
            pie:
              allowPointSelect: true,
              cursor: 'pointer',
              dataLabels:
                enabled: true,
                color: '#000000',
                connectorColor: '#000000',
                format: '{point.name},  {percentage:.1f} %'
        series: []
        title:
          text: question.title
        loading: false

      values = []
      for n in question.options
        values.push [n.value, n.count]

      chartConfig.series.push data: values
      console.log chartConfig
      chartConfig

    # Functions for defining question kind for ng-ifs
    $scope.isRadio = (kind) ->
      kind == "Radiobutton"

    $scope.isCheckbox = (kind) ->
      kind == "Checkbox"

  ]
