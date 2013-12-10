'use strict'

angular.module('angularAktivatorApp')
.factory 'Tag', ['$resource','databaseUrl',($resource,databaseUrl) ->
    $resource databaseUrl+'/tags/:id', id: '@id'
]
