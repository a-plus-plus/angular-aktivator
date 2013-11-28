'use strict'

angular.module('angularAktivatorApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute'
  'angularAktivatorApp.webService',
  'angularAktivatorApp.storageService',
  'ngAnimate'
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
    .when '/answer/:id',
      templateUrl: '/views/answer.html'
      controller: 'AnswerCtrl'
    .when '/results/:id',
      templateUrl: '/views/results.html'
      controller: 'ResultsCtrl'
    .when '/tags',
      templateUrl: '/views/tag.html'
      controller: 'TagCtrl'
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


angular.module('angularAktivatorApp').run ['$rootScope','Session', 'messageService',($rootScope,Session, messageService) ->
  $rootScope.$on("$routeChangeStart", (event, next, current)->
    if next.requireLogin and !Session.isLogged()
      messageService.setResponseMsg({value:"You don't have authorization to do that!", type:"error"})
      next.templateUrl = 'views/404.html'

  )
]
