'use strict'

describe 'Service: Webservice', () ->

  # load the service's module
  beforeEach module 'AngularaktivatorApp'

  # instantiate service
  Webservice = {}
  beforeEach inject (_Webservice_) ->
    Webservice = _Webservice_

  it 'should do something', () ->
    expect(!!Webservice).toBe true
