'use strict'

angular.module('angularAktivatorApp')
.controller 'SurveyCtrl', ['$scope','Survey', 'RailsFormatter', ($scope, Survey, RailsFormatter) ->
	
	$scope.surveys = Survey.query()
	$scope.survey = {questions:[]}

	$scope.info = (event) ->
		console.log($scope.survey);

	$scope.newQuestion = (event) ->
		event.preventDefault()
		$scope.survey.questions.push({kind:'Radiobutton', options:[]})

	$scope.removeQuestion = (question, event, index, survey) ->
		event.preventDefault()
		if (question.id)
			question.destroy = 1
		else
			survey.questions.splice(index, 1)

	$scope.newOption = (event, question) ->
		event.preventDefault()
		question.options.push({})

	$scope.removeOption = (option, event, index, question) ->
		event.preventDefault()
		if question.id
			option.destroy = 1
		else
			question.options.splice(index,1)

	$scope.test = (event, survey) ->
		console.log(survey)

	$scope.submit = (survey) ->
		survey.user_id = 1 # @TODO USE REAL USER ID
		survey = {survey:RailsFormatter.prepare(survey)}
		Survey.save survey, (->
			$scope.message = "Survey added!"
			$scope.survey = {questions:[]}
		), (err) -> 
			$scope.message = "Error adding survey: " + err.data.title
]
