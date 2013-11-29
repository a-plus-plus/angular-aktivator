'use strict'
By = protractor.By

describe 'Answering a survey', ->
  ptor = undefined
  
  beforeEach ->
    ptor = protractor.getInstance()
    browser.get('#')
    element(By.linkText('Surveys')).click()



  it 'shows the result button for each survey', ->

