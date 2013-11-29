'use strict'
By = protractor.By

describe 'Answering a survey', ->
  ptor = undefined
  username = undefined
  password = undefined
  logout = undefined
  login = undefined


  beforeEach ->
    ptor = protractor.getInstance()
    browser.get('#')
    username = element(By.model('user.name'))
    login    = element(By.id('login'))
    password = element(By.model('user.password'))

    # Loggin in...
    username.sendKeys('Arto')
    password.sendKeys('ratebeeR123')
    login.click()

    element(By.linkText('Surveys')).click()


  afterEach ->
    logout = element(By.id('logout'))
    logout.click()


  # it 'shows the result button for each survey', ->

  #   div_child = 2 # Surveys start from the second div
  #   button_string_first = '.container div:nth-child(' 
  #   button_string_last  = ') h3:nth-child(1) a:nth-child(4) button:nth-child(1)'

  #   surveys = ptor.findElements(By.repeater('survey in surveys'))
  #   surveys.then (surveys) ->
  #     for survey in surveys
  #       button_string = button_string_first + div_child + button_string_last
  #       div_child = div_child + 1
  #       button = $(button_string)
  #       expect(button.isDisplayed()).toBe(true)
  #       expect(button.isEnabled()).toBe(true)
  #       expect(button.getText()).toBe('Results')

  # it 'redirects the browser to the result view after pressing the Results button', ->
    
  #   first_survey_name = $('.container div:nth-child(2) h3:nth-child(1) a:nth-child(1)').getText()
  #   first_result_button = $('.container div:nth-child(2) h3:nth-child(1) a:nth-child(4) button:nth-child(1)')
  #   first_result_button.click()

  #   result_title = $('h1.ng-scope').getText()
  #   # expect(first_survey_name).toBe('toimii')
  #   title_should_be = 'Results for ' + first_survey_name + ''
  #   expect(result_title).toBe(title_should_be)