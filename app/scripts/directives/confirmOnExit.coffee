'use strict'

angular.module('angularAktivatorApp')
  .directive 'confirmOnExit', [->
    restrict: 'EA'
    link: (scope, element, attrs) ->
      scope.$on '$locationChangeStart', (e)->
        # if scope[attrs.confirmOnExit].$dirty and !confirm('You have unsaved changes. Continue?')
        #   e.preventDefault()
  ]
