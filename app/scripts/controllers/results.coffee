'use strict'

angular.module('angularAktivatorApp')
  .controller 'ResultsCtrl', ['$scope','Results', '$rootScope', ($scope, Results, $rootScope) ->
    $scope.results = Results.query()


    $scope.giveRootMsgToScope = () ->
    	ret = true	   
    	if $rootScope.responseSuccessMessage != ""
    		$scope.message = $rootScope.responseSuccessMessage.toString()    		
	   		$rootScope.responseSuccessMessage = ""
	   	if $rootScope.responseSuccessMessage == "" and $scope.message.length == 0
	   		ret = false
	   	ret
  ]
