'use strict'

describe 'Service: Survey', () ->

  # load the service's module
  beforeEach module 'AngularaktivatorApp'

  # instantiate service
  Survey = {}
  beforeEach inject (_Survey_) ->
    Survey = _Survey_

  it 'should do something', () ->
    expect(!!Survey).toBe true
