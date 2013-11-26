'use strict'

angular.module('angularAktivatorApp')
  .controller 'messageController', ['$scope', 'messageService', ($scope, messageService) ->

    $scope.$watch () ->
        messageService.getMessages()
    , (messages) ->
        $scope.messages = messages

  ]
