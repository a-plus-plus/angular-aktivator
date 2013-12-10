'use strict'

angular.module('angularAktivatorApp')
  .factory 'Response', ['$resource','databaseUrl',($resource,databaseUrl) ->
    $resource databaseUrl+'/responses/:id', id: '@id'
  ]
