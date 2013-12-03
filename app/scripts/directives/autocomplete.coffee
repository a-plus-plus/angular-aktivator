'use strict'

angular.module('angularAktivatorApp')
  .directive 'autocomplete', [->
    restrict: 'EA'
    require: '?ngModel'
    scope: {
      autocomplete:'='
      pluck:'@'
    }
    link: (scope, element, attrs, modelCtrl) ->
      scope.autocomplete.$promise.then ->
        if scope.pluck
          elems = $.map scope.autocomplete, (obj)-> obj[scope.pluck]
        else
          elems = angular.copy scope.autocomplete

        element.typeahead({
          source:elems
        })
  ]
