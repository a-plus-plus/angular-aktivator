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


  ]
