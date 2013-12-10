'use strict'

angular.module('angularAktivatorApp')
  .factory 'Results', ['$resource','databaseUrl',($resource,databaseUrl) ->
    $resource databaseUrl+'/responses/:id', id: '@id'
  ]
