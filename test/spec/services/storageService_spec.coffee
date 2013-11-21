'use strict'

describe 'Service: storageService', () ->

  # load the service's module
  beforeEach module 'angularAktivatorApp'

  # instantiate service
  storageService = {}
  beforeEach inject (_storageService_) ->
    storageService = _storageService_

  it 'should do something', () ->
    expect(!!storageService).toBe true
