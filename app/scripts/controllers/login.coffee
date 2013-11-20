'use strict'

angular.module('angularAktivatorApp')
.controller 'LoginCtrl', ['$scope','$location', 'webService', 'storageService', '$http', ($scope, $location, webService, storageService, $http) ->

	
	$scope.login = (user) ->
		

		success = (response) ->
			storageService.store "token", response.data.token
			storageService.store "name", response.data.name
			$location.url "home"
			console.log ' SUCCESS great success!'
			$http.defaults.headers.common['name'] = response.data.name
			$http.defaults.headers.common['token'] = response.data.token
			user.name = ''
			user.password = ''

		error = (response) ->
			console.log response
			
		promise = webService.login(user)
		promise.then success, error


	$scope.logout = ->

		success = (response) ->
			storageService.logout()
			$location.path('/')


		error = (response) ->
			console.log response
			storageService.logout()

		promise = webService.logout()
		promise.then success, error
]
