'use strict'

describe 'Service: Response', () ->

  # load the service's module
  beforeEach module 'AngularaktivatorApp'

  # instantiate service
  Response = {}
  beforeEach inject (_Response_) ->
    Response = _Response_

  it 'should do something', () ->
    expect(!!Response).toBe true
