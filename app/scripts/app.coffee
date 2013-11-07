'use strict'

angular.module('angularAktivatorApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize'
])
  .config ['$routeProvider', ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/surveys',
        templateUrl: 'views/survey.html'
        controller: 'SurveyCtrl'
      .otherwise
        redirectTo: '/'
  ]
