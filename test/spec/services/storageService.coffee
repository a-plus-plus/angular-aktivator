'use strict'

describe 'Service: Storageservice', () ->

  # load the service's module
  beforeEach module 'AngularaktivatorApp'

  # instantiate service
  Storageservice = {}
  beforeEach inject (_Storageservice_) ->
    Storageservice = _Storageservice_

  it 'should do something', () ->
    expect(!!Storageservice).toBe true
