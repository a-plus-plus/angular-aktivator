'use strict'

describe 'Service: Registration', () ->

  # load the service's module
  beforeEach module 'angularAktivatorApp'

  # instantiate service
  User = {}
  beforeEach inject (_User_) ->
    User = _User_

  it 'should do something', () ->
    expect(!!User).toBe true
