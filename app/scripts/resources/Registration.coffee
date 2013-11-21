'use strict'

angular.module('angularAktivatorApp')
  .factory 'User', ['$resource',($resource) ->
    $resource 'http://localhost\\:3000/users/:id', id: '@id'    
  ]