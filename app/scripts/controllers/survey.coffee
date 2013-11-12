'use strict'

angular.module('angularAktivatorApp')
.controller 'SurveyCtrl', ['$scope','Survey', 'RailsFormatter', ($scope, Survey, RailsFormatter) ->
	
	$scope.surveys = Survey.query()
	$scope.survey = {questions:[]}

	$scope.info = (event) ->
		console.log($scope.surveys);

	$scope.newQuestion = (event) ->
		console.log('new question!')
		event.preventDefault()
		$scope.survey.questions.push({kind:'Radiobutton', options:[]})

	$scope.removeQuestion = (question, event, index) ->
		console.log('removing question', question)
		event.preventDefault()
		question.destroy = 1

	$scope.newOption = (event, question) ->
		console.log("new option for", question)
		event.preventDefault()
		question.options.push({})

	$scope.removeOption = (option, event, index) ->
		console.log('removing option', option)
		event.preventDefault()
		option.destroy = 1

	$scope.test = (event, survey) ->
		console.log(survey)

	$scope.submit = (survey) ->
		survey.user_id = 1
		survey = {survey:RailsFormatter.prepare(survey)}
		console.log(survey)
		Survey.save(survey)
]
