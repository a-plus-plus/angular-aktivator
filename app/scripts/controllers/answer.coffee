'use strict'

# Contains functions used by answer.html

angular.module('angularAktivatorApp')
  .controller 'AnswerCtrl', ['$scope', 'Survey', '$routeParams','Response', 'RailsFormatter', '$location', '$rootScope', ($scope, Survey, $routeParams, Response, RailsFormatter, $location, $rootScope) ->
    $scope.survey = Survey.get(id: $routeParams.id)
    $scope.response = []
    $rootScope.responseSuccessMessage = ""
    # $scope.response = {survey_id:$scope.survey.id, answers:[]} <- this would be nice :)

    # Submits the response to the server
    $scope.submit = () ->
        clearEmpty()        
        response = {
            response:RailsFormatter.prepare({
                answers:$scope.response
                survey_id: $scope.survey.id
            })
        } 
        console.log(response)
        Response.save(response, redirectToResults, (err) ->
            $scope.message = "Something went wrong - your response was not saved!"
        )


    # Removes all blank textbox answers from the response
    clearEmpty = () ->
        $scope.response.forEach (elem, index) ->
            if !elem.value and !elem.option_id                
                $scope.response.splice(index, 1)

    # Pushes the current radio button answer to the response
    $scope.radiobuttonSave = (question_id, option_id) ->
        elem = {
            question_id:question_id
        }
        deleteWhere(elem)
        elem.option_id = option_id
        $scope.response.push(elem)

    # Pushes the current checkbox answer(s) to the response
    $scope.checkboxSave = (question_id, option_id) ->        
        elem = {
            question_id:question_id, 
            option_id:option_id
        }
        if !deleteWhere(elem)
            $scope.response.push(elem) 

    # Initializes a textbox answer
    $scope.initTextbox = (q_id) ->
        $scope.response.push({question_id:q_id})

    # Deletes obsolete data from the response (eg a checked checkbox value if a user decides to uncheck it)
    deleteWhere = (obj) ->
        ret = false
        !$scope.response.forEach (elem, index) ->
            if elem.question_id == obj.question_id
                if !obj.option_id or obj.option_id == elem.option_id 
                    $scope.response.splice(index,1)
                    ret= true
        ret

    # Redirects the browser to the results page
    redirectToResults = () ->
        $rootScope.responseSuccessMessage = "Your response was saved successfully!"
        $location.path('/results/' + $routeParams.id)


    # Functions for defining question kind for ng-ifs
    $scope.isRadio = (kind) ->
        kind == "Radiobutton"

    $scope.isCheckbox = (kind) ->
        kind == "Checkbox"

    $scope.isTextfield = (kind) ->
        kind == "Textfield"

     
            
            
  ]
