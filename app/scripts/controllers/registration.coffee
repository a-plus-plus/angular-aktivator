'use strict'

angular.module('angularAktivatorApp')
.controller 'UserCtrl', ['$scope','User', ($scope, User) ->
	
	$scope.Users = User.query()

	$scope.info = (event) ->
		console.log($scope.Users);

	$scope.newUser = (event) ->
		console.log('new user!')
		event.preventDefault()
		$scope.Users.push({name:'', password:'', password_confirmation:''})	

]
