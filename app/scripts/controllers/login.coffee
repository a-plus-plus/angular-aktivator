'use strict'

angular.module('angularAktivatorApp')
.controller 'LoginCtrl', ['$scope','$location', 'webService', 'storageService', '$http', ($scope, $location, webService, storageService, $http) ->

	$scope.login = (user) ->
		

		success = (response) ->
			storageService.store "token", response.data.token
			storageService.store "name", response.data.name
			$location.url "home"
			console.log ' SUCESS great success!'
			$http.defaults.headers.common['name'] = response.data.name
			$http.defaults.headers.common['token'] = response.data.token

		error = (response) ->
			console.log response
			
		promise = webService.login(user)
		promise.then success, error
]
