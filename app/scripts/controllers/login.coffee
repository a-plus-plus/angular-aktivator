'use strict'

angular.module('angularAktivatorApp')
.controller 'LoginCtrl', ['$scope','$location', 'webService', 'storageService', ($scope, $location, webService, storageService) ->

	$scope.login = (user) ->
		

		success = (response) ->
			storageService.store "token", response.data.token
			storageService.store "name", response.data.name
			$location.url "home"
			console.log ' SUCESS great success!'

		error = (response) ->
			console.log response
		promise = webService.login(user)
		promise.then success, error
]
