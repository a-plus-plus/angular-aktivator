'use strict'

angular.module('angularAktivatorApp')
.controller 'SurveyCtrl', ['$scope','Survey', ($scope, Survey) ->
	
	$scope.surveys = Survey.query()

	$scope.info = (event) ->
		console.log($scope.surveys);

	$scope.newQuestion = (event) ->
		console.log('new question!')
		event.preventDefault()
		$scope.surveys.questions.push({kind:'Radiobutton', options:[]})	

]
