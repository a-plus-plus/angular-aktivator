'use strict'

angular.module('angularAktivatorApp')
.controller 'LoginCtrl', ['$scope','Session', "storageService", 'messageService','$route', '$location', ($scope, Session, storageService, messageService, $route, $location) ->

  $scope.username = storageService.get("username")
  $scope.$watch ->
    storageService.get('username')
  , (name)->
    $scope.username = name

  $scope.login = (user) ->
    Session.login(user, ->
      $scope.user = {}
      $location.path('/index')
      $route.reload()
    , ->
      messageService.setResponseMsg({value:"invalid login", type:"error"})
    )

  $scope.logout = ->
    Session.logout(->
      $location.path('/index')
      $route.reload()
    )

  $scope.isLogged = ->
    Session.isLogged()
  ]
