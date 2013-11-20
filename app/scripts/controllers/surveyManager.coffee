'use strict'

angular.module('angularAktivatorApp')
  .controller 'SurveyManagerCtrl', ['$scope','Survey', 'RailsFormatter', '$routeParams','Tag','filterFilter', '$location', ($scope, Survey, RailsFormatter, $routeParams,Tag, filterFilter, $location) ->
	

	id = $routeParams.id
	console.log id
	$scope.survey = if id =='new' then {tags:[], questions:[]} else Survey.get(id:id, tags:[setTagIds])
	$scope.tags = Tag.query(setTagIds)
	

	setTagIds = () ->
		if !angular.isArray $scope.survey.tags or !angular.isArray $scope.tags
			return
		$scope.survey.tags.forEach (elem) ->
			$scope.tags.forEach (elem2) ->
				if elem.id == elem2.id
					elem2.selected = true
	
	# Returns true when creating a new survey and false when editing an existing survey, used by ng-ifs
	$scope.isNew = () ->
		if id == 'new'
			true
		else
			false

	# Saves selected tag to an array
	$scope.tagSave = (tag_id, title) ->
		elem = {
			title:title
			id:tag_id			
			}		        
		if !deleteWhere(elem)
			$scope.survey.tags.push(elem)

	# Helper function for tagSave(); deletes unchecked values from a tag array
	deleteWhere = (obj) ->
        ret = false
        !$scope.survey.tags.forEach (elem, index) ->
            if elem.id == obj.id
                    $scope.survey.tags.splice(index,1)
                    ret= true
        ret

    # Returns true if tag is selected - used by submit function and html checkbox-related code
	$scope.isSelected = (tag) ->
		ret = false
		if angular.isArray $scope.survey.tags
			!$scope.survey.tags.forEach (elem, index) ->
				if elem.id == tag.id
					ret = true
					return
		ret

	# Redirects to survey listing
	redirectToListing = () ->
		$location.path('/surveys')

	$scope.newQuestion = (event) ->
		event.preventDefault()
		$scope.survey.questions.push({kind:'Radiobutton', options:[]})

	$scope.removeQuestion = (question, event, index, survey) ->
		event.preventDefault()
		if (question.id)
			question._destroy = 1
		else
			survey.questions.splice(index, 1)

	$scope.newOption = (event, question) ->
		event.preventDefault()
		question.options.push({})

	$scope.removeOption = (option, event, index, question) ->
		event.preventDefault()
		if question.id
			option._destroy = 1
		else
			question.options.splice(index,1)


	$scope.submit = (survey) ->
		survey = angular.copy survey
		survey.user_id = 1 # @TODO USE REAL USER ID

		survey = {survey:RailsFormatter.prepare(survey)}
		survey.survey.tag_ids = []
		$scope.tags.forEach (tag) ->
			if ($scope.isSelected(tag))
				survey.survey.tag_ids.push(tag.id)
		if (survey.survey.id)
			Survey.update id:survey.survey.id, survey, (->
				redirectToListing() # $scope.message = "Survey updated!"
				$scope.survey = {questions:[]}
			), (err) -> 
				$scope.message = "Error adding survey: " + err.data.title
		else
			Survey.save survey, (->
				redirectToListing() # $scope.message = "Survey added!"
				$scope.survey = {questions:[]}
			), (err) -> 
				$scope.message = "Error adding survey: " + err.data.title
  ]
