'use strict'

angular.module('angularAktivatorApp')
.factory 'Tag', ['$resource',($resource) ->
    # Service logic
    # ...

    # Public API here
    $resource 'http://localhost\\:3000/tags/:id', id: '@id'
]