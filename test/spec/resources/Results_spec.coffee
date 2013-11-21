'use strict'

describe 'Service: Results', () ->

  # load the service's module
  beforeEach module 'angularAktivatorApp'

  # instantiate service
  Results = {}
  beforeEach inject (_Results_) ->
    Results = _Results_

  it 'should do something', () ->
    expect(!!Results).toBe true
