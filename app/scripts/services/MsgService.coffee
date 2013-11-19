'use strict'

angular.module('angularAktivatorApp')
  .service 'Msgservice', () ->

  	responseMsg = ""

  	getResponseMsg = () ->
  		responseMsg 

  	setResponseMsg = (msg) ->
  		responseMsg = msg

    # Not in use currently, was supposed to be used by answer.coffee, but injecting won't work for some reason
