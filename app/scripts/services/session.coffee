'use strict'

angular.module('angularAktivatorApp')
  .service 'Session',['storageService', 'webService', '$http', '$rootScope','$timeout', (storageService, webService, $http, $rootScope,$timeout) ->
    # AngularJS will instantiate a singleton by calling "new" on this function

    @login = (user, okCallb, errCallb) ->

      success = (response) ->
        console.log 'We are at success'
        name = response.data.name
        token = response.data.token
        username = response.data.username
        console.log 'SUCCESS great success! username:' + username
        storageService.saveCredentials(name, token, username)
        okCallb()

      error = (response) ->
        console.log 'we are at error!'
        #console.log(response)
        errCallb()


      promise = webService.login(user)
      promise.then success, error
      console.log "logging in"

    @logout = (okCallb) ->
      success = (response) ->
        storageService.logout()
        okCallb()


      error = (response) ->
        console.log response
        storageService.logout()

      promise = webService.logout()
      promise.then success, error
      console.log "logging out"

    @isLogged = () ->
        name = storageService.get('name')
        token = storageService.get('token')
        username = storageService.get('username')
        token and name
    this
]
