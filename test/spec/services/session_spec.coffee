'use strict'

describe 'Service: Session', () ->
  Session = storageService = User = $q  = $rootScope = user = deferred = errorCallback = okCallback = null

  # load the service's module
  beforeEach module 'angularAktivatorApp'



  # instantiate service
  Session = {}
  beforeEach inject (_Session_, _storageService_, _User_, _$q_, _$rootScope_) ->
    Session = _Session_
    storageService = _storageService_
    User = _User_
    $q = _$q_
    $rootScope = _$rootScope_



  beforeEach ->
    storageService.get = jasmine.createSpy('get')
    storageService.saveCredentials = jasmine.createSpy('saveCredentials')
    storageService.deleteCredentials = jasmine.createSpy('deleteCredentials')
    deferred = $q.defer()
    User.login = jasmine.createSpy('login').andReturn({$promise:deferred.promise})
    User.logout = jasmine.createSpy('logout').andReturn({$promise:deferred.promise})

  it 'should exist', () ->
    expect(!!Session).toBe yes

  describe "Session login tests", ->
    beforeEach ->
      user = {name: 'Arto', token: '12345678', username: 'Troller'}
      okCallback = jasmine.createSpy('okCallback')
      errorCallback = jasmine.createSpy('errorCallback')
      Session.login(user, okCallback, errorCallback)
      deferred.resolve(user)
      $rootScope.$apply()

    it 'should provide a login function', ->
      expect(typeof Session.login).toBe('function')

    it 'should call User.login', ->
      expect(User.login).toHaveBeenCalledWith(user)

    it 'should call storageService.saveCredentials', ->
      expect(storageService.saveCredentials).toHaveBeenCalledWith(user.name, user.token, user.username)

    it 'promise success should call okCallback', ->
      expect(User.login).toHaveBeenCalledWith(user)
      expect(errorCallback).not.toHaveBeenCalledWith()
      expect(okCallback).toHaveBeenCalledWith()


  describe "Session logout tests", ->
    beforeEach ->
      okCallback = jasmine.createSpy('okCallback')
      Session.logout(okCallback)
      deferred.resolve(user)
      $rootScope.$apply()

    it 'should provide a logout function', ->
      expect(typeof Session.logout).toBe('function')

    it 'should call User.logout', ->
      expect(User.logout).toHaveBeenCalledWith()

    it 'should call storageService.deleteCredentials', ->
      expect(storageService.deleteCredentials).toHaveBeenCalledWith()

    it 'promise succes should call okCallback', ->
      expect(okCallback).toHaveBeenCalledWith()

  it 'should provide a isLogged function', ->
    expect(typeof Session.isLogged).toBe('function')

  it 'isLogged function should call storageService.get', ->
    Session.isLogged()
    expect(storageService.get).toHaveBeenCalledWith('name')
    expect(storageService.get).toHaveBeenCalledWith('token')
    expect(storageService.get).toHaveBeenCalledWith('username')
    expect(storageService.get.callCount).toBe(3)
