'use strict'

# Not in use currently - was supposed to be used by answer.coffee and results.coffee
angular.module('angularAktivatorApp', [])
  .service 'MsgService', () ->
  	responseMsg = ""

  	setMsg = (msg) ->
		responseMsg = msg

	getMsg = () ->
		responseMsg