'use strict'

describe 'Controller: LoginCtrl', () ->
  LoginCtrl = scope = storageService = Session = messageService = null

  # load the controller's module
  beforeEach module 'angularAktivatorApp'

  module ($provide) ->
    $provide.value 'storageService', new MockStorageService()
    $provide.value 'Session', new MockSession()
    $provide.value 'messageService', new MockMessageService()

    null

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope, _Session_, _storageService_, _messageService_) ->
    scope = $rootScope.$new()
    Session = _Session_
    storageService = _storageService_
    messageService = _messageService_
    LoginCtrl = $controller 'LoginCtrl', {
      $scope: scope
    }

  beforeEach ->
    storageService.get = jasmine.createSpy('get')
    Session.login = jasmine.createSpy('login')
    Session.logout = jasmine.createSpy('logout')
    Session.isLogged = jasmine.createSpy('isLogged')
    messageService.setResponseMsg = jasmine.createSpy('setResponseMsg')


  it 'should call storageService', ->
    scope.$digest()
    expect(storageService.get.callCount).toBe(2)
    expect(storageService.get).toHaveBeenCalledWith("username")

  it 'should provide a login function', ->
    expect(typeof scope.login).toBe 'function'

  it 'login function should call Session.login', ->
    user = {name: 'Arto', password: '12345678'}
    scope.login(user)
    expect(Session.login.callCount).toBe(1)
    expect(Session.login).toHaveBeenCalledWith(user, jasmine.any(Function), jasmine.any(Function))

  it 'should provide a logout function', ->
    expect(typeof scope.logout).toBe 'function'

  it 'logout function should call Session.logout', ->
    scope.logout()
    expect(Session.logout.callCount).toBe(1)
    expect(Session.logout).toHaveBeenCalledWith(jasmine.any(Function))

  it 'should provide a isLogged function', ->
    expect(typeof scope.isLogged).toBe 'function'

  it 'isLogged function should call Session.isLogged', ->
    scope.isLogged()
    expect(Session.isLogged.callCount).toBe(1)
    expect(Session.isLogged).toHaveBeenCalledWith()





