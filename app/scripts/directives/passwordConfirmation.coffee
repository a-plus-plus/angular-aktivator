'use strict'

angular.module('angularAktivatorApp')
  .directive 'passwordConfirmation', [->
    template: '<div></div>'
    restrict: 'E'
    link: (scope, element, attrs) ->
      element.text 'this is the passwordConfirmation directive'
  ]
