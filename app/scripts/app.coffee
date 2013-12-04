'use strict'

angular.module('angularAktivatorApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute'
  'angularAktivatorApp.webService',
  'ngAnimate',
  'chartjs-directive'
])
.config ['$routeProvider', '$locationProvider','$httpProvider', ($routeProvider, $locationProvider, $httpProvider) ->
  #$locationProvider.html5Mode true
  $httpProvider.interceptors.push( 'authenticationInterceptor')
  $routeProvider
    .when '/',
      templateUrl: '/views/main.html'
      controller: 'MainCtrl'
    .when '/surveys',
      templateUrl: '/views/survey.html'
      controller: 'SurveyCtrl'
    .when '/surveyUI',
      templateUrl: '/views/surveyUI.html'
      controller: 'SurveyCtrl'
    .when '/answer/:id',
      templateUrl: '/views/answer.html'
      controller: 'AnswerCtrl'
    .when '/results/:id',
      templateUrl: '/views/results.html'
      controller: 'ResultsCtrl'
    .when '/tags',
      templateUrl: '/views/tag.html'
      controller: 'TagCtrl'
      requireLogin: true
    .when '/registration',
      templateUrl: '/views/registration.html'
      controller: 'UserCtrl'
    .when '/surveys/:id',
      templateUrl:'/views/surveyManager.html'
      controller: 'SurveyManagerCtrl'
      requireLogin: true
    .otherwise
      templateUrl:'views/404.html'
]


