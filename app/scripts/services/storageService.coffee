'use strict'

angular.module 'angularAktivatorApp.storageService', [], ($provide) ->
	$provide.factory 'storageService', -> new storageService()
	
	store = (key, value) ->
		localStorage.setItem(key, value)

	get = (key) ->
		localStorage.getItem key
	
	deleteItem = (key) ->
		localStorage.removeItem(key)

	logout = ->
		localStorage.removeItem("name")
		localStorage.removeItem("token")

    # AngularJS will instantiate a singleton by calling "new" on this function
