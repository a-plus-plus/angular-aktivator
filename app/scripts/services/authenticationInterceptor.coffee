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
    }
]
