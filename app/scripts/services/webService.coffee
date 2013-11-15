'use strict'

angular.module 'angularAktivatorApp.webService', [], ($provide) ->
	$provide.factory 'webService', '$http', 'storageService', ($http, storageService) -> new webService($http, storageService)
	
	baseUrl = "/"
	
	login = (user) ->
		@$http.post(@baseUrl + "login", {user: {name: user.name, password: user.password}})

	getAuthHeaders = () ->
		{name: @storageService.get("name"), token: @storageService.get("token")}

	logout = () ->
		@$http.delete(@baseUrl + "logout", {headers: @getAuthHeaders()})

	getGreeting = () ->
		@$http.get(@baseUrl + "greet", {headers: @getAuthHeaders()})

	getSurveys = () ->
		@$http.get(@baseUrl + "surveys", {headers: @getAuthHeaders()})

    # AngularJS will instantiate a singleton by calling "new" on this function
