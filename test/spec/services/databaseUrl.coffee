'use strict'

describe 'Service: Databaseurl', () ->

  # load the service's module
  beforeEach module 'angularAktivatorApp'

  # instantiate service
  Databaseurl = {}
  beforeEach inject (_Databaseurl_) ->
    Databaseurl = _Databaseurl_

  it 'should do something', () ->
    expect(!!Databaseurl).toBe true
