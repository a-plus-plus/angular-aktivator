'use strict'

angular.module('angularAktivatorApp')
  .factory 'Results', ['$resource',($resource) ->
    $resource 'http://localhost\\:3000/responses/:id', id: '@id'
  ]
