'use strict'

angular.module('angularAktivatorApp')
.controller('UserCtrl', ['$scope','User', 'RailsFormatter','$location', ($scope, User, RailsFormatter, $location) ->
  
  $scope.users = User.query()
  $scope.user = {}
  $scope.message = ''

  $scope.info = (event) ->
    console.log($scope.users);

  $scope.errorMsg = () ->
    $scope.message.length > 0

  $scope.submit = (user) ->
    user = {user:user}
    console.log(user)
    User.save(user, redirectToLogin , (obj) ->
      if obj.data.email
        $scope.message = "E-mail " + obj.data.email[0] + "!"
      if obj.data.name
        $scope.message = "Username " + obj.data.name[0] + "!"
    )

  redirectToLogin = () ->
    console.log "Kirjautuminen onnistui"
    $location.path('/login')
]



.directive( "usernameVerify", ->
  require: "ngModel"
  scope:
    usernameVerify: "="
    users: "@users"

  link: (scope, element, attrs, UserCtrl) ->
    scope.$watch (->
      combined = undefined
      combined = scope.usernameVerify + "_" + UserCtrl.$viewValue  if scope.usernameVerify or UserCtrl.$viewValue
      combined
    ), (value) ->
      if value
        UserCtrl.$parsers.unshift (viewValue) ->
          origin = scope.users
          console.log origin
          if true
            UserCtrl.$setValidity "usernameVerify", false
            `undefined`
          else
            UserCtrl.$setValidity "usernameVerify", true
            viewValue
 )



.directive( "passwordVerify", ->
  require: "ngModel"
  scope:
    passwordVerify: "="

  link: (scope, element, attrs, UserCtrl) -> #@TODO remove strict dependency to UserCtrl, directive shouldn't be dependant on any specific controller
    scope.$watch (->
      combined = undefined
      combined = scope.passwordVerify + "_" + UserCtrl.$viewValue  if scope.passwordVerify or UserCtrl.$viewValue
      combined
    ), (value) ->
      if value
        UserCtrl.$parsers.unshift (viewValue) ->
          origin = scope.passwordVerify
          #console.log viewValue
          if origin isnt viewValue
            UserCtrl.$setValidity "passwordVerify", false
            `undefined`
          else
            UserCtrl.$setValidity "passwordVerify", true
            viewValue
 )



# .directive "passwordVerify", ["$http", ($http) ->
#   require: "ngModel"
#   link: (scope, ele, attrs, c) ->
#     scope.$watch attrs.ngModel, ->
#       $http(
#         method: "POST"
#         url: "/api/check/" + attrs.passwordVerify
#         data:
#           field: attrs.passwordVerify
#       ).success((data, status, headers, cfg) ->
#         c.$setValidity "unique", data.isUnique
#       ).error (data, status, headers, cfg) ->
#         c.$setValidity "unique", false


# ]



