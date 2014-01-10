'use strict'

angular.module('angularAktivatorApp')
  .controller 'messageCtrl', ['$scope', 'messageService', ($scope, messageService) ->

    $scope.$watch () ->
      messageService.getMessages()
    , (messages) ->
      $scope.messages = messages
    $scope.messages = messageService.getMessages()
  ]
