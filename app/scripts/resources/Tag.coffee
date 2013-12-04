'use strict'

angular.module('angularAktivatorApp')
.factory 'Tag', ['$resource',($resource) ->
    $resource 'http://localhost\\:3000/tags/:id', id: '@id'
]
