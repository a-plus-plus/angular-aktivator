'use strict'

describe 'Service: RailsFormatter', () ->

  # load the service's module
  beforeEach module 'AngularaktivatorApp'

  # instantiate service
  RailsFormatter = {}
  beforeEach inject (_RailsFormatter_) ->
    RailsFormatter = _RailsFormatter_

  it 'should do something', () ->
    expect(!!RailsFormatter).toBe true
