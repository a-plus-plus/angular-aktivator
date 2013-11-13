'use strict'

describe 'Service: Tagging', () ->

  # load the service's module
  beforeEach module 'angularAktivatorApp'

  # instantiate service
  Tagging = {}
  beforeEach inject (_Tagging_) ->
    Tagging = _Tagging_

  it 'should do something', () ->
    expect(!!Tagging).toBe true
