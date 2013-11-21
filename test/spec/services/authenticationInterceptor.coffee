'use strict'

describe 'Service: Authenticationinterceptor', () ->

  # load the service's module
<<<<<<< HEAD
  beforeEach module 'angularAktivatorApp'
=======
  beforeEach module 'AngularaktivatorApp'
>>>>>>> 3a45071e37444a07e147c3bb41daa70b474d240c

  # instantiate service
  Authenticationinterceptor = {}
  beforeEach inject (_Authenticationinterceptor_) ->
    Authenticationinterceptor = _Authenticationinterceptor_

  it 'should do something', () ->
    expect(!!Authenticationinterceptor).toBe true
