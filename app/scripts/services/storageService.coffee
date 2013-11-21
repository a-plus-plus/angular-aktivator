"use strict"

class StorageService

  saveCredentials: (name, token) ->
    @store("name",name)
    @store("token",token)
  store: (key, value) ->
    localStorage.setItem(key, value)

  get: (key) ->
    localStorage.getItem key

  deleteItem: (key) ->
    localStorage.removeItem(key)

  logout: ->
    localStorage.removeItem("name")
    localStorage.removeItem("token")

angular.module "angularAktivatorApp.storageService", [], ($provide) ->
  $provide.factory "storageService", -> new StorageService()
