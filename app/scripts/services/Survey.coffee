'use strict'

angular.module('angularAktivatorApp')
  .factory 'Survey', ['$resource',($resource) ->
    # Service logic
    # ...

    # Public API here
    $resource 'http://localhost\\:3000/surveys/:id', id: '@id', {update:{method:'PUT'}}
  ]
