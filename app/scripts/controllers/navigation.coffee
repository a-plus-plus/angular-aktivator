'use strict'

angular.module('angularAktivatorApp')
  .controller 'NavigationCtrl', ['$scope', '$location', ($scope, $location) ->
    $scope.links = [
    	{text:'Home',link:'/'},
    	{text:'Surveys',link:'/surveys'},
    	{text:'Tags',link:'/tags'}
    ]
    $scope.isActive = (viewLocation) ->
    	viewLocation == $location.path()

  ]
