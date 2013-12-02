'use strict'

describe 'Service: Session', () ->
  Session = storageService = webService = $q = $rootScope = user = deferred = null

  # load the service's module
  beforeEach module 'angularAktivatorApp'

  module ($provide) ->
    $provide.value 'storageService', new MockStorageService()
    $provide.value 'webService', new MockWebService()

    null

  # instantiate service
  Session = {}
  beforeEach inject (_Session_ , _storageService_, _webService_, _$q_, _$rootScope_) ->
    Session = _Session_
    storageService = _storageService_
    webService = _webService_
    $q = _$q_
    $rootScope = _$rootScope_


  beforeEach ->
    storageService.get = jasmine.createSpy('get').andReturn()
    storageService.saveCredentials = jasmine.createSpy('saveCredentials')
    deferred = $q.defer()
    #deferred.resolve(user)
    webService.login = jasmine.createSpy('login').andReturn(deferred.promise)

  it 'should exist', () ->
    expect(!!Session).toBe yes

  it 'should provide a login function', ->
    expect(typeof Session.login).toBe('function')

  it 'should call webService.login', ->
    user = {data:{name: 'Arto', token: '12345678'}}
    okCallback = jasmine.createSpy('okCallback')
    errorCallback = jasmine.createSpy('errorCallback')
    Session.login(user, okCallback, errorCallback)
    expect(webService.login).toHaveBeenCalledWith(user)


  it 'promise success should call okCallback', ->

    user = {data:{name: 'Arto', token: '12345678'}}
    okCallback = jasmine.createSpy('okCallback')
    errorCallback = jasmine.createSpy('errorCallback')
    Session.login(user, okCallback, errorCallback)
    deferred.resolve(user)
    $rootScope.$apply()
    expect(webService.login).toHaveBeenCalledWith(user)
    expect(errorCallback).not.toHaveBeenCalledWith()
    expect(okCallback).toHaveBeenCalledWith()


  it 'should provide a logout function', ->
    expect(typeof Session.logout).toBe('function')

  it 'should provide a isLogged function', ->
    expect(typeof Session.isLogged).toBe('function')

  it 'isLogged function should call storageService.get', ->
    Session.isLogged()
    expect(storageService.get).toHaveBeenCalledWith('name')
    expect(storageService.get).toHaveBeenCalledWith('token')
    expect(storageService.get).toHaveBeenCalledWith('username')
    expect(storageService.get.callCount).toBe(3)

