'use strict'

describe 'Service: authenticationInterceptor', () ->

  # load the service's module
  beforeEach module 'angularAktivatorApp'

  # instantiate service
  authenticationInterceptor = {}
  beforeEach inject (_authenticationInterceptor_) ->
    authenticationInterceptor = _authenticationInterceptor_

  it 'should do something', () ->
    expect(!!authenticationInterceptor).toBe true
