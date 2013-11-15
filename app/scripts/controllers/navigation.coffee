'use strict'

angular.module('angularAktivatorApp')
  .controller 'NavigationCtrl', ['$scope', '$location', ($scope, $location) ->
	$scope.links = [
		{text:'Home',			link:'/'}
		{text:'Surveys', 		link:'/surveys'}
		{text:'Results', 		link: '/results'}
		{text:'Tags',			link:'/tags'}
		{text:'Registration', 	link:'/registration'}
		{text:'Create Survey',	link:'/surveys/new'}
		{text:'Login',	link:'/login'}
	]
	$scope.isActive = (viewLocation) ->
		viewLocation == $location.path()
  ]
