'use strict'

angular.module('angularAktivatorApp')
.controller('UserCtrl', ['$scope','User', 'RailsFormatter','$location', ($scope, User, RailsFormatter, $location) ->
	
	$scope.users = User.query()
	$scope.user = {}

	$scope.info = (event) ->
		console.log($scope.users);

	$scope.submit = (user) ->
		user = {user:user}
		console.log(user)
		User.save(user, redirectToLogin , (obj) ->
			$scope.response = obj.data
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



