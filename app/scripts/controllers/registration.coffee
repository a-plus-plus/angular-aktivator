'use strict'

angular.module('angularAktivatorApp')
.controller('UserCtrl', ['$scope','User', 'RailsFormatter','$location', ($scope, User, RailsFormatter, $location) ->
  
  $scope.users = User.query()
  $scope.user = {}
  $scope.message = ''

  $scope.info = (event) ->
    console.log($scope.users);

  $scope.errorMsg = () ->
    alert("lolwut")
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
    alert "Kirjautuminen onnistui"
    $location.path('/login')    
    
]

).directive( "passwordVerify", ->
  require: "ngModel"
  scope:
    passwordVerify: "="

  link: (scope, element, attrs, UserCtrl) ->
    scope.$watch (->
      combined = undefined
      combined = scope.passwordVerify + "_" + UserCtrl.$viewValue  if scope.passwordVerify or UserCtrl.$viewValue
      combined
    ), (value) ->
      if value
        UserCtrl.$parsers.unshift (viewValue) ->
          origin = scope.passwordVerify
          if origin isnt viewValue
            UserCtrl.$setValidity "passwordVerify", false
            `undefined`
          else
            UserCtrl.$setValidity "passwordVerify", true
            viewValue
 )



