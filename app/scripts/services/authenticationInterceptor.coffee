'use strict'

angular.module('angularAktivatorApp')
  .factory 'authenticationInterceptor', ['storageService','$q','messageService','$location',(storageService,$q,messageService,$location) ->
    {
      request: (config)->
        #console.log 'requestInterceptorconfig: ', config
        name = storageService.get('name')
        token = storageService.get('token')
        if name and token
          config.headers['name'] = name
       	  config.headers['token'] = token
        config

      responseError: (config) ->
        console.log 'responseErr', config
        if config.status == 401 and config.data.user
          messageService.setResponseMsg {value:"You don't seem to have access to that!", type:'error'}
          $location.path('/404')
        $q.reject(config)
    }
]
