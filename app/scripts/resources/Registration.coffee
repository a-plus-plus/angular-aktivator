'use strict'

angular.module('angularAktivatorApp')
  .factory 'User', ['$resource','databaseUrl',($resource, databaseUrl) ->
    $resource databaseUrl+'/users/:id', id: '@id'
  ]
