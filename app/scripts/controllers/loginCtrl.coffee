'use strict'

angular.module('angularAktivatorApp')
.controller 'LoginCtrl', ['$scope','Session', "storageService", ($scope, Session, storageService) ->

  $scope.username = storageService.get("username")

  $scope.login = (user) ->
    Session.login(user, ->
      $scope.user = {}
    )

  $scope.logout = ->
    Session.logout()

  $scope.isLogged = ->
    Session.isLogged()
  ]
