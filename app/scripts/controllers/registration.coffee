'use strict'

angular.module('angularAktivatorApp')
.controller 'UserCtrl', ['$scope','User', 'RailsFormatter','$location', ($scope, User, RailsFormatter, $location) ->
	
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

