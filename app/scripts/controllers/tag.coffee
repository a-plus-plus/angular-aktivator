'use strict'

angular.module('angularAktivatorApp')
.controller 'TagCtrl', ['$scope','Tag', ($scope, Tag) ->

	$scope.tags = Tag.query()
	$scope.tag = {}
	$scope.message = ""

	$scope.submit = (tag) ->
		Tag.save(tag)
		$scope.message = tag.title + " added!"
		$scope.tag = {}
]
