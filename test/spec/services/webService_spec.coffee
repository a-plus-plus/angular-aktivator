'use strict'

describe 'Service: webService', () ->

  # load the service's module
  beforeEach module 'angularAktivatorApp'

  # instantiate service
  webService = {}
  beforeEach inject (_webService_) ->
    webService = _webService_

  it 'should do something', () ->
    expect(!!webService).toBe true
