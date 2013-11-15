"use strict"

class StorageService

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