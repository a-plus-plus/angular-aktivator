'use strict'

angular.module('angularAktivatorApp')
.controller 'LoginCtrl', ['$scope','Session', ($scope, Session) ->


  $scope.login = (user) ->
    Session.login(user, ->
      $scope.user = {}
    )


  $scope.logout = ->
    Session.logout()


  $scope.isLogged = ->
    Session.isLogged()
]
