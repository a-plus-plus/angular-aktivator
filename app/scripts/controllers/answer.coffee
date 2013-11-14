'use strict'

angular.module('angularAktivatorApp')
  .controller 'AnswerCtrl', ['$scope', 'Survey', '$routeParams','Response', 'RailsFormatter', ($scope, Survey, $routeParams, Response, RailsFormatter) ->
    $scope.survey = Survey.get(id: $routeParams.id)
    $scope.response = []
    #$scope.response = {survey_id:$scope.survey.id, answers:[]}

    $scope.clicksubmit = () ->
        clearEmpty()        
        response = {
            response:RailsFormatter.prepare({
                answers:$scope.response
                survey_id: $scope.survey.id
            })
        } 
        console.log(response)
        Response.save(response)

    clearEmpty = () ->
        $scope.response.forEach (elem, index) ->
            if !elem.value and !elem.option_id                
                $scope.response.splice(index, 1)

    $scope.radiobuttonSave = (question_id, option_id) ->
        elem = {
            question_id:question_id
        }
        deleteWhere(elem)
        elem.option_id = option_id
        $scope.response.push(elem)

    $scope.initTextbox = (q_id) ->
        $scope.response.push({question_id:q_id})

    deleteWhere = (obj) ->
        ret = false
        !$scope.response.forEach (elem, index) ->
            if elem.question_id == obj.question_id
                if !obj.option_id or obj.option_id == elem.option_id 
                    $scope.response.splice(index,1)
                    ret= true
        ret

     
    $scope.checkboxSave = (question_id, option_id) ->        
        elem = {
            question_id:question_id, 
            option_id:option_id
        }
        if !deleteWhere(elem)
            $scope.response.push(elem)         
            
  ]
