'use strict'

describe 'Service: storageService', () ->
  storageService = storage = null
  # load the service's module
  beforeEach module 'angularAktivatorApp'

   # instantiate service
  storageService = {}
  beforeEach inject (_storageService_) ->
    storageService = _storageService_

  beforeEach ->
    storage = {}
    spyOn(localStorage, 'getItem').andCallFake (key) ->
      storage[key]
    spyOn(localStorage, 'setItem').andCallFake (key, value) ->
      storage[key] = value
    spyOn(localStorage, 'removeItem').andCallFake ->
      storage = {}


  it 'should provide saveCredentials function', ->
    expect(typeof storageService.saveCredentials).toBe('function')

  it 'saveCredentials should call store', ->
    spyOn(storageService, 'store')
    storageService.saveCredentials('arto', 'asdasdasd', 'trolli')
    expect(storageService.store).toHaveBeenCalledWith('name', 'arto')
    expect(storageService.store).toHaveBeenCalledWith('token', 'asdasdasd')
    expect(storageService.store).toHaveBeenCalledWith('username', 'trolli')


  it 'should provide store function', ->
    expect(typeof storageService.store).toBe('function')

  it 'store should call localStorage.setItem', ->
    storageService.store('name', 'arto')
    expect(localStorage.setItem).toHaveBeenCalledWith('name', 'arto')

  it 'should provide get function', ->
    expect(typeof storageService.get).toBe('function')

  it 'get should call localStorage.getItem', ->
    storageService.get('joku')
    expect(localStorage.getItem).toHaveBeenCalledWith('joku')

  it 'should provide deleteCredentials', ->
    expect(typeof storageService.deleteCredentials).toBe('function')

  it 'deleteCredentials should call storageService.deleteItem', ->
    spyOn(storageService, 'deleteItem')
    storageService.deleteCredentials()
    expect(storageService.deleteItem).toHaveBeenCalledWith('name')
    expect(storageService.deleteItem).toHaveBeenCalledWith('token')
    expect(storageService.deleteItem).toHaveBeenCalledWith('username')

  it 'deleteItem should call localStorage.removeItem', ->
    storageService.deleteItem('name')
    expect(localStorage.removeItem).toHaveBeenCalledWith('name')
