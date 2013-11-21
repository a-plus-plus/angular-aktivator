'use strict'

angular.module('angularAktivatorApp')
  .service 'Session',['storageService', 'webService', '$http', '$rootScope','$timeout', (storageService, webService, $http, $rootScope,$timeout) ->
    # AngularJS will instantiate a singleton by calling "new" on this function

    logged = false



    @login = (user, okCallb, errCallb) ->

      success = (response) ->
        logged = true
        name = response.data.name
        token = response.data.token
        console.log 'SUCCESS great success!'
        storageService.saveCredentials(name, token)
        okCallb()

      error = (response) ->
        #console.log(response)
        errCallb()


      promise = webService.login(user)
      promise.then success, error
      console.log "logging in"

    @logout = () ->
      logged = false
      success = (response) ->
        storageService.logout()
        #$location.path('/')


      error = (response) ->
        console.log response
        storageService.logout()

      promise = webService.logout()
      promise.then success, error
      console.log "logging out"

    @isLogged = () ->
        #console.log "is logged in"
        logged
    this
]
