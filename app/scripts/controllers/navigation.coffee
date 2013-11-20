'use strict'

angular.module('angularAktivatorApp')
  .controller 'NavigationCtrl', ['$scope', '$location', 'webService', 'storageService', ($scope, $location, webService, storageService) ->
	$scope.links = [
		{text:'Home',			link:'/'}
		{text:'Surveys', 		link:'/surveys'}
		{text:'Tags',			link:'/tags'}
		{text:'Registration', 	link:'/registration'}
		{text:'Create Survey',	link:'/surveys/new'}
	]

	$scope.isActive = (viewLocation) ->
		viewLocation == $location.path()

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
