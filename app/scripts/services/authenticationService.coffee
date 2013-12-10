'use strict'

class WebService

  constructor: (@$http, @storageService, databaseUrl) ->
    @baseUrl = databaseUrl

  login: (user) ->
    @$http.post(@baseUrl + "/login", {user: {name: user.name, password: user.password}})

  getAuthHeaders: () ->
    {name: @storageService.get("name"), token: @storageService.get("token")}

  logout: () ->
    @$http.delete(@baseUrl + "/logout", {headers: @getAuthHeaders()})

angular.module( "angularAktivatorApp")
.factory 'webService',["$http", "storageService", 'databaseUrl',($http, storageService,databaseUrl) -> new WebService($http, storageService,databaseUrl)]
