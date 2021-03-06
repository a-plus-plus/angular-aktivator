'use strict'

angular.module('angularAktivatorApp')
.controller('UserCtrl', ['$scope','User', 'RailsFormatter','$location', 'messageService', ($scope, User, RailsFormatter, $location, messageService) ->

  $scope.users = User.query()
  $scope.user = {}
  $scope.message = ''

  $scope.info = (event) ->
    console.log($scope.users);

  $scope.errorMsg = () ->
    $scope.message.length > 0

  $scope.submit = (user) ->
    User.save(user, success , (obj) ->
      if obj.data.email
        $scope.message = "E-mail " + obj.data.email[0] + "!"
      if obj.data.name
        $scope.message = "Username " + obj.data.name[0] + "!"
    )

  success = () ->
    messageService.setResponseMsg({value:"Created new user, please login using your username and password", type:"success"})
    $location.path('/')
])

.directive( "passwordVerify", ->
  require: "ngModel"
  scope:
    passwordVerify: "="

  link: (scope, element, attrs, ngController) ->
    scope.$watch (->
      combined = undefined
      combined = scope.passwordVerify + "_" + ngController.$viewValue  if scope.passwordVerify or ngController.$viewValue
      combined
    ), (value) ->
      if value
        ngController.$parsers.unshift (viewValue) ->
          origin = scope.passwordVerify
          if origin isnt viewValue
            ngController.$setValidity "passwordVerify", false
            `undefined`
          else
            ngController.$setValidity "passwordVerify", true
            viewValue
 )


.directive( "usernameVerify", ->
  require: "ngModel"
  scope: true
  link: (scope, element, attrs, ngController) ->
    scope.$watch (->
      ngController.$viewValue
    ), (value) ->
      if value
        ngController.$parsers.unshift (viewValue) ->
          valid = true
          scope.users.forEach (elem) ->
            if elem.name == viewValue
              valid = false
          ngController.$setValidity 'usernameVerify', valid
          viewValue
 )





