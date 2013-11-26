'use strict'

angular.module('angularAktivatorApp')
  .controller 'NavigationCtrl', ['$scope', '$location', 'webService', 'storageService', 'Session', ($scope, $location, webService, storageService , Session) ->



    setNavigationBars = () ->
        if Session.isLogged() then (
            $scope.links = [
                {text:'Home',           link:'/'}
                {text:'Surveys',        link:'/surveys'}
                {text:'Create Survey',  link:'/surveys/new'}
                {text:'Tags',           link:'/tags'}
            ]
        )else (
            $scope.links = [
                {text:'Home',           link:'/'}
                {text:'Surveys',        link:'/surveys'}
                {text:'Registration',   link:'/registration'}
            ]
        )

    $scope.$watch () ->
      Session.isLogged()
    ,setNavigationBars
    setNavigationBars()
    $scope.isActive = (viewLocation) ->
        viewLocation == $location.path()


  ]
