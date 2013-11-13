'use strict'

angular.module('angularAktivatorApp')
  .factory 'Tagging', [() ->
    # Service logic
    # ...

    $resource 'http://localhost\\:3000/taggings/:id', id: '@id'
  ]
