'use strict'

describe 'Service: Authenticationinterceptor', () ->

  # load the service's module
  beforeEach module 'angularAktivatorApp'

  # instantiate service
  Authenticationinterceptor = {}
  beforeEach inject (_Authenticationinterceptor_) ->
    Authenticationinterceptor = _Authenticationinterceptor_

  it 'should do something', () ->
    expect(!!Authenticationinterceptor).toBe true
