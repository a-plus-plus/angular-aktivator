'use strict'

angular.module('angularAktivatorApp')
  .factory 'authenticationInterceptor', ['$httpProvider',($httpProvider) ->
    $httpProvider.interceptor.push (config)->
      console.log config, 'ASDASDASDASDASD'
  ]
