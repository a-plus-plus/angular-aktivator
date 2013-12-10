'use strict'

angular.module('angularAktivatorApp')
.controller 'TagCtrl', ['$scope','Tag','messageService', ($scope, Tag, messageService) ->

  $scope.tags = Tag.query()
  $scope.tag = {}

  $scope.submit = (tag) ->
    Tag.save tag, (tag)->
      messageService.setResponseMsg({value:tag.title + " added!", type:"success"})
      $scope.tag = {}
      $scope.tags.push(tag)
    , (err) ->
      messageService.setResponseMsg({value:"Error adding tag: " + err.data.title, type:"error"})

  ]
