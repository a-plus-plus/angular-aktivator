'use strict'

angular.module('angularAktivatorApp')
.controller 'UserCtrl', ['$scope','User', 'RailsFormatter', ($scope, User, RailsFormatter) ->
	
	$scope.users = User.query()
	$scope.user = {}

	$scope.info = (event) ->
		console.log($scope.users);

	$scope.submit = (user) ->
		user = {user:user}
		console.log(user)
		User.save(user, ()->
			console.log('success')
		, (obj) ->
			$scope.response = obj.data
		)

]
