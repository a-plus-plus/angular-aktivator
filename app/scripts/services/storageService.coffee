"use strict"

class StorageService

  saveCredentials: (name, token, username) ->
    @store("name",name)
    @store("token",token)
    @store("username",username)

  store: (key, value) ->
    localStorage.setItem(key, value)

  get: (key) ->
    localStorage.getItem key

  deleteItem: (key) ->
    localStorage.removeItem(key)

  deleteCredentials: ->
    @deleteItem("name")
    @deleteItem("token")
    @deleteItem("username")

angular.module("angularAktivatorApp")
  .factory 'storageService', [-> new StorageService()]
