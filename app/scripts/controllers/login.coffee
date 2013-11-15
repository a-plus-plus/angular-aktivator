'use strict'

angular.module('angularAktivatorApp')
.controller 'LoginCtrl', ['$scope','$location', 'webService', 'storageService', ($scope, $location, webService, storageService) ->

	$scope.login = (user) ->
		promise = webService.login(user)
		promise.then success, error

		success(response) =>
			storageService.store "token", response.data.token
			storageService.store "email", response.data.email
			$location.url "home"

		error(response) =>
			console.log response
			
]
