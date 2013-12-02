'use strict'

angular.module('angularAktivatorApp')
  .factory 'authenticationInterceptor', ['storageService','$q','messageService','$location',(storageService,$q,messageService,$location) ->
    {
      request: (request)->
        name = storageService.get('name')
        token = storageService.get('token')
        if name and token
          request.headers['name'] = name
       	  request.headers['token'] = token
        request

      responseError: (response) ->
        console.log 'responseErr', response
        if response.status == 401 and !response.config.data.user
          messageService.setResponseMsg {value:"You don't seem to have access to that!", type:'error'}
          $location.path('/404')
        $q.reject(response)
    }
]
