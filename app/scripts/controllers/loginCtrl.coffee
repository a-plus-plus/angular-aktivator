'use strict'

angular.module('angularAktivatorApp')
.controller 'LoginCtrl', ['$scope','Session', "storageService", 'messageService', ($scope, Session, storageService, messageService) ->

  $scope.username = storageService.get("username")
  $scope.$watch ->
    storageService.get('username')
  , (name)->
    $scope.username = name

  $scope.login = (user) ->
    Session.login(user, ->
      $scope.user = {}
    , ->
      messageService.setResponseMsg({value:"invalid login", type:"error"})
    )

  $scope.logout = ->
    Session.logout()

  $scope.isLogged = ->
    Session.isLogged()
  ]
