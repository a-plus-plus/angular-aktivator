'use strict'

describe 'Service: Tag', () ->

  # load the service's module
  beforeEach module 'angularAktivatorApp'

  # instantiate service
  Tag = {}
  beforeEach inject (_Tag_) ->
    Tag = _Tag_

  it 'should do something', () ->
    expect(!!Tag).toBe true
