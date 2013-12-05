'use strict'

angular.module('angularAktivatorApp')
  .controller 'NavigationCtrl', ['$scope', '$location', 'webService', 'storageService', 'Session', ($scope, $location, webService, storageService , Session) ->



    setNavigationBars = () ->
        if Session.isLogged() then (
            $scope.links = [
                {text:'Surveys',        link:'/'}
                {text:'Create Survey',  link:'/surveys/new'}
                {text:'Tags',           link:'/tags'}
            ]
        )else (
            $scope.links = [
                {text:'Surveys',        link:'/'}
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
