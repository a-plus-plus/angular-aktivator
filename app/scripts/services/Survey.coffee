'use strict'

angular.module('angularAktivatorApp')
  .factory 'Survey', ['$resource',($resource) ->
    $resource 'http://localhost\\:3000/surveys/:id', id: '@id', {update:{method:'PUT'}}
  ]
