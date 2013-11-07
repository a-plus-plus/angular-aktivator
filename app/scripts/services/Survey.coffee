'use strict'

angular.module('angularAktivatorApp')
  .factory 'Survey', ['$resource',($resource) ->
    # Service logic
    # ...

    meaningOfLife = 42

    # Public API here
    $resource 'http://localhost\\:3000/surveys'
  ]
