'use strict'

angular.module('angularAktivatorApp')
  .controller 'messageController', ['$scope', 'messageService', ($scope, messageService) ->
    
    $scope.$watch () ->
        messageService.getResponseMsg()
    , () ->
        $scope.message = messageService.getResponseMsg()
    
  ]
