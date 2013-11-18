'use strict'

angular.module('angularAktivatorApp')
  .controller 'ResultsCtrl', ['$scope','Results', '$rootScope', ($scope, Results, $rootScope) ->
    $scope.results = Results.query()

    # Checks whether $rootScope has a responseSuccessMessage, and, if it does, gives that as a string to $scope.message
    $scope.giveRootMsgToScope = () ->
    	ret = true	   
    	if $rootScope.responseSuccessMessage != ""
    		$scope.message = $rootScope.responseSuccessMessage.toString()    		
	   		$rootScope.responseSuccessMessage = ""
	   	if $rootScope.responseSuccessMessage == "" and $scope.message.length == 0
	   		ret = false
	   	ret
  ]
