'use strict'

angular.module('angularAktivatorApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize'
])
  .config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
    #$locationProvider.html5Mode true
    $routeProvider
      .when '/',
        templateUrl: '/views/main.html'
        controller: 'MainCtrl'
      .when '/surveys',
        templateUrl: '/views/survey.html'
        controller: 'SurveyCtrl'
      .when '/answer/:id', 
        templateUrl: '/views/answer.html'
        controller: 'AnswerCtrl'
      .when '/registration',
        templateUrl: '/views/registration.html'
        controller: 'UserCtrl'
      .otherwise
        redirectTo: '/'
  ]
