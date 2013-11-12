'use strict'

angular.module('angularAktivatorApp')
  .factory 'User', ['$resource',($resource) ->
    # Service logic
    # Public API here
    $resource 'http://localhost\\:3000/users/:id', id: '@id'    
  ]