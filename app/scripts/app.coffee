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
      .when '/answer/:id', 
        templateUrl: 'views/answer.html'
        controller: 'AnswerCtrl'  
      .otherwise
        redirectTo: '/'
  ]
