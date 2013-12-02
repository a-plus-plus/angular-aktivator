'use strict'
By = protractor.By

describe 'Answering a survey', ->
  ptor = undefined
  username = undefined
  password = undefined
  logout = undefined
  login = undefined
  survey = ""


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



  it 'creates a new survey for tests below', ->
    element(By.linkText('Create Survey')).click()
    newQuestion = element(By.id('newQuestion'))
    title =       element(By.model('survey.title'))
    submit =      element(By.id('submit'))

    newSurvey = uniqueString(15)
    title.sendKeys(newSurvey)

    # Radio question and options
    newQuestion.click()
    radioOption = $('div.ng-scope:nth-child(11) fieldset:nth-child(1) #newOption')
    radioOption.click()
    radioOption.click()
    radioOption.click()

    # Checkbox question and option
    newQuestion.click()

    kindSelector = $('div.ng-scope:nth-child(12) fieldset:nth-child(1) select:nth-child(5) option:nth-child(2)')
    kindSelector.click()

    checkOption = $('div.ng-scope:nth-child(12) fieldset:nth-child(1) #newOption')
    checkOption.click()
    checkOption.click()
    checkOption.click()

    # Textbox question
    newQuestion.click()
    kindSelector = $('div.ng-scope:nth-child(13) fieldset:nth-child(1) select:nth-child(5) option:nth-child(3)')
    kindSelector.click()

    # Typing the questions
    questions = ptor.findElements(By.repeater('question in survey.questions'))
    questions.then (questions) ->
      expect(questions.length).toBe 3
      qtitle = questions[0].findElement(By.textarea('question.title'))
      qtitle.sendKeys('Radio button question?')
      qtitle = questions[1].findElement(By.textarea('question.title'))
      qtitle.sendKeys('Checkbox question?')
      qtitle = questions[2].findElement(By.textarea('question.title'))
      qtitle.sendKeys('Textbox question?')

      # Typing the options
      options = ptor.findElements(By.repeater('option in question.options'))
      options.then (options) ->
        expect(options.length).toBe 6
        optionvalue = options[0].findElement(By.textarea('option.value'))
        optionvalue.sendKeys('A')
        optionvalue = options[1].findElement(By.textarea('option.value'))
        optionvalue.sendKeys('B')
        optionvalue = options[2].findElement(By.textarea('option.value'))
        optionvalue.sendKeys('C')
        optionvalue = options[3].findElement(By.textarea('option.value'))
        optionvalue.sendKeys('A')
        optionvalue = options[4].findElement(By.textarea('option.value'))
        optionvalue.sendKeys('B')
        optionvalue = options[5].findElement(By.textarea('option.value'))
        optionvalue.sendKeys('C')

    submit.click()
    survey = newSurvey


  it 'shows the result button for each survey', ->

    div_child = 2 # Surveys start from the second div
    button_string_first = '.container div:nth-child('
    button_string_last  = ') h3:nth-child(1) a:nth-child(5) button:nth-child(1)'

    surveys = ptor.findElements(By.repeater('survey in surveys'))
    surveys.then (surveys) ->
      for survey in surveys
        button_string = button_string_first + div_child + button_string_last
        div_child = div_child + 1
        button = $(button_string)
        expect(button.isDisplayed()).toBe(true)
        expect(button.isEnabled()).toBe(true)
        expect(button.getText()).toBe('Results')


  it 'redirects the browser to the result view after pressing the Results button', ->

    surveys = ptor.findElements(By.repeater('survey in surveys'))
    surveys.then (surveys) ->
      index = surveys.length - 1
      my_survey_name = surveys[index].findElement(By.tagName('a')).getText()
      my_survey_results = surveys[index].findElement(By.className('result_button'))
      my_survey_results.click()
      result_title = $('h1.ng-scope').getText()
      my_survey_name.then (my_survey_name) ->
        title_should_be = 'Results for ' + my_survey_name
        expect(result_title).toBe(title_should_be)
        protractor.getInstance().findElement(By.css('body')).getDriver().sleep(5000)

  it 'shows the results to all questions in a survey', ->
    # Navigating to last survey
    surveys = ptor.findElements(By.repeater('survey in surveys'))
    surveys.then (surveys) ->
      index = surveys.length - 1
      my_survey_name = surveys[index].findElement(By.tagName('a')).getText()
      my_survey_results = surveys[index].findElement(By.className('result_button'))
      my_survey_results.click()

    # Checking that the test-created survey contains three questions and six options
    questions = ptor.findElements(By.repeater('question in result.questions'))
    questions.then (questions) ->
      expect(questions.length).toEqual(3)
      options = ptor.findElements(By.repeater('option in question.options'))
      options.then (options) ->
        expect(options.length).toEqual(6)

    zeroString = '0'
    expect($('.container > ul:nth-child(2) > ul:nth-child(2) > li:nth-child(1) > h5:nth-child(2)').getText()).toEqual(zeroString)
    expect($('.container > ul:nth-child(2) > ul:nth-child(3) > li:nth-child(1) > h5:nth-child(2)').getText()).toEqual(zeroString)
    expect($('.container > ul:nth-child(2) > ul:nth-child(4) > li:nth-child(1) > h5:nth-child(2)').getText()).toEqual(zeroString)
    expect($('.container > ul:nth-child(3) > ul:nth-child(2) > li:nth-child(1) > h5:nth-child(2)').getText()).toEqual(zeroString)
    expect($('.container > ul:nth-child(3) > ul:nth-child(3) > li:nth-child(1) > h5:nth-child(2)').getText()).toEqual(zeroString)
    expect($('.container > ul:nth-child(3) > ul:nth-child(4) > li:nth-child(1) > h5:nth-child(2)').getText()).toEqual(zeroString)

  it 'shows a diagram with the results', ->
    # Navigating to last survey
    surveys = ptor.findElements(By.repeater('survey in surveys'))
    surveys.then (surveys) ->
      index = surveys.length - 1
      my_survey_name = surveys[index].findElement(By.tagName('a')).getText()
      my_survey_results = surveys[index].findElement(By.className('result_button'))
      my_survey_results.click()

    chart = $('.ng-isolate-scope > canvas:nth-child(1)')
    expect(chart.isDisplayed()).toBe(true)


  # it 'shows the results to a textbox question', ->




uniqueString = (length) ->
  str = ""
  str += Math.random().toString(36).substr(2) while str.length < length
  str.substr 0, length
