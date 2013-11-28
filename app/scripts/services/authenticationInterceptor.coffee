'use strict'

angular.module('angularAktivatorApp')
  .factory 'authenticationInterceptor', ['storageService',(storageService) ->
    {
      request: (config)->
        #console.log 'requestInterceptorconfig: ', config
        name = storageService.get('name')
        token = storageService.get('token')

        if name and token
          config.headers['name'] = name
       	  config.headers['token'] = token


        config

      response: (config) ->
        console.log 'response', config
        config

      responseError: (config) ->
        console.log 'responseErr', config
        config
    }
]
