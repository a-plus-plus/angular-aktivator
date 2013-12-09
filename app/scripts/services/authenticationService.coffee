'use strict'

class WebService

  constructor: (@$http, @storageService) ->
    @baseUrl = "http://localhost:3000/"

  login: (user) ->
    @$http.post(@baseUrl + "login", {user: {name: user.name, password: user.password}})

  getAuthHeaders: () ->
    {name: @storageService.get("name"), token: @storageService.get("token")}

  logout: () ->
    @$http.delete(@baseUrl + "logout", {headers: @getAuthHeaders()})

  getGreeting: () ->
    @$http.get(@baseUrl + "greet", {headers: @getAuthHeaders()})

  getPosts: () ->
    @$http.get(@baseUrl + "posts", {headers: @getAuthHeaders()})

angular.module( "angularAktivatorApp")
.factory 'webService',["$http", "storageService", ($http, storageService) -> new WebService($http, storageService)]
