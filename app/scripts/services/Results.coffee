'use strict'

angular.module('angularAktivatorApp')
  .factory 'Results', ['$resource',($resource) ->
    # Service logic
    # ...

    
    # Public API here
    $resource 'http://localhost\\:3000/responses/:id', id: '@id'
  ]
