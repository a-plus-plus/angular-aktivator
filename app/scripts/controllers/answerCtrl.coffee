'use strict'

# Contains functions used by answer.html

angular.module('angularAktivatorApp')
  .controller 'AnswerCtrl', ['$scope', 'Survey', '$routeParams','Response', 'RailsFormatter', 'storageService' ,'$location', '$rootScope','messageService', ($scope, Survey, $routeParams,  Response, RailsFormatter, storageService, $location, $rootScope, messageService) ->
    $scope.survey = Survey.get {id: $routeParams.id} , ->
        $scope.key = "answered_to_#{$scope.survey.id}"
        if storageService.get($scope.key)
            redirectToResults1("You may answer only once!", 'error')
            return
    $scope.response = {answers:[]} # <- this would be nice :)
    $scope.survey.$promise.then ->
      $scope.response.survey_id = $scope.survey.id

    # Submits the response to the server
    $scope.submit = () ->
        #response = {answers:$scope.response}
        clearEmpty($scope.response.answers)
        response = angular.copy($scope.response)
        # remove this, do this in resource
        RailsFormatter.transformNested(response, ['answers'])
        response = { response:response }
        # end removethis

        console.log(response)

        # Tässä kerrotaan et oot vastannut j

        storageService.store($scope.key, 1)

        Response.save(response, redirectToResults, (err) ->
            messageService.setResponseMsg {value:"Something went wrong: " + err.data.message, type:'error'}
        )


    # Removes all blank textbox answers from the response
    clearEmpty = (answers) ->
        answers.forEach (elem, index) ->
            if !elem.value and !elem.option_id
                $scope.response.answers.splice(index, 1)

    # Pushes the current radio button answer to the response
    $scope.radiobuttonSave = (question_id, option_id) ->
        elem = {
            question_id:question_id
        }
        deleteWhere(elem)
        elem.option_id = option_id
        $scope.response.answers.push(elem)

    # Pushes the current checkbox answer(s) to the response
    $scope.checkboxSave = (question_id, option_id) ->
        elem = {
            question_id:question_id,
            option_id:option_id
        }
        if !deleteWhere(elem)
            $scope.response.answers.push(elem)

    # Initializes a textbox answer
    $scope.initTextbox = (q_id) ->
        $scope.response.answers.push({question_id:q_id})

    # Deletes obsolete data from the response (eg a checked checkbox value if a user decides to uncheck it)
    deleteWhere = (obj) ->
        answers = $scope.response.answers
        ret = false
        !answers.forEach (elem, index) ->
            if elem.question_id == obj.question_id
                if !obj.option_id or obj.option_id == elem.option_id
                    answers.splice(index,1)
                    ret= true
        ret

    # Redirects the browser to the results page
    redirectToResults = () ->
        messageService.setResponseMsg({value: "Your responce was saved successfully!", type: 'success'})
        $location.path('/results/' + $routeParams.id)

    # Redirects the browser to the results page
    redirectToResults1 = (msg, type) ->
        messageService.setResponseMsg({value: msg, type: type})
        $location.path('/results/' + $routeParams.id)


    # Functions for defining question kind for ng-ifs
    $scope.isRadio = (kind) ->
        kind == "Radiobutton"

    $scope.isCheckbox = (kind) ->
        kind == "Checkbox"

    $scope.isTextfield = (kind) ->
        kind == "Textfield"

    # Returns true if scope has an error message - used by ng-if
    $scope.errorMsg = () ->
        $scope.message and $scope.message.length > 0


  ]
