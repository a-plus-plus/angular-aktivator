'use strict'

angular.module('angularAktivatorApp')
  .service 'Session',['storageService', 'User', '$http', '$rootScope','$timeout', (storageService, User, $http, $rootScope,$timeout) ->
    # AngularJS will instantiate a singleton by calling "new" on this function

    @login = (user, okCallb, errCallb) ->

      success = (response) ->
        name = response.name
        token = response.token
        username = response.username
        storageService.saveCredentials(name, token, username)
        okCallb and okCallb()

      error = (response) ->
        errCallb and errCallb()


      promise = User.login(user).$promise
      promise.then success, error

    @logout = (okCallb) ->
      success = (response) ->
        storageService.deleteCredentials()
        okCallb and okCallb()


      error = (response) ->
        storageService.deleteCredentials()

      promise = User.logout().$promise
      promise.then success, error

    @isLogged = () ->
        name = storageService.get('name')
        token = storageService.get('token')
        username = storageService.get('username')
        token and name
    this
]
