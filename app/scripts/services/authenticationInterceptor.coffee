'use strict'

angular.module('angularAktivatorApp')
  .factory 'authenticationInterceptor', ['storageService',(storageService) ->
    {
      request: (config)->
        console.log 'requestInterceptorconfig: ', config
        config.headers['name'] = storageService.get('name')
        config.headers['token'] = storageService.get('token')
        config
    }
]
