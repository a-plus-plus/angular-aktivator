'use strict'

angular.module('angularAktivatorApp')
  .factory 'User', ['$resource','databaseUrl','storageService',($resource, databaseUrl, storageService) ->
    transform = (data, headersGetter)->
      angular.toJson {user: data }

    interceptor = {
      request:(config)  ->
        config.headers.name = storageService.get("name")
        config.headers.token = storageService.get("token")
        config
    }

    $resource databaseUrl+'/users/:id', id: '@id',{
      'login':     {method:'POST', transformRequest:transform, url:databaseUrl+'/login/'}
      'logout': {method:'DELETE', interceptor: interceptor, url:databaseUrl+'/logout/'}
      'save':     {method:'POST', transformRequest:transform}
      'update': {method:'PUT', transformRequest:transform}
    }
  ]
