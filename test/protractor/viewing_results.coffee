'use strict'
By = protractor.By

describe 'Viewing results', ->
  ptor = undefined
  username = undefined
  password = undefined
  logout = undefined
  login = undefined
  survey_name = ""


  beforeEach ->
    ptor = protractor.getInstance()
    browser.get('#')
    username = element(By.model('user.name'))
    login    = element(By.id('login'))
    password = element(By.model('user.password'))

    # Logging in...
    username.sendKeys('Arto')
    password.sendKeys('ratebeeR123')
    login.click()

    element(By.linkText('Surveys')).click()


  afterEach ->
    logout = element(By.id('logout'))
    logout.click()



  it 'creates a new survey for tests below', ->
    element(By.linkText('Create Survey')).click()
    newQuestion = element(By.css('.newQuestion'))
    title =       element(By.model('survey.title'))
    submit =      element(By.css('.submit'))

    newSurvey = uniqueString(15)
    title.sendKeys(newSurvey)

    # Status
    $('#survey_status [value="Published"]').click()

    # Radio question and options
    newQuestion.click()
    radioOption = $('.question_0 .newOption')
    radioOption.click()
    radioOption.click()
    radioOption.click()

    # Checkbox question and option
    newQuestion.click()

    kindSelector = $('.question_1 .kind_selector [value="Checkbox"]')
    kindSelector.click()

    checkOption = $('.question_1 .newOption')
    checkOption.click()
    checkOption.click()
    checkOption.click()

    # Textbox question
    newQuestion.click()
    kindSelector = $('.question_2 .kind_selector [value="Textfield"')
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
    survey_name = newSurvey


  it 'shows the result button for each finished and published survey', ->
    survey_index = 0
    surveys = ptor.findElements(By.repeater('survey in surveys'))
    surveys.then (surveys) ->
      for survey in surveys
        status = $ '.survey_'+survey_index+' .status'
        results = $ '.survey_'+survey_index+' .results'
        status.getText().then (text) ->
          if text != 'Unpublished'
            expect(results.isDisplayed()).toBe(true)
            expect(results.getText()).toBe('Results')
        survey_index++


  it 'redirects the browser to the result view after pressing the Results button', ->
    surveys = ptor.findElements(By.repeater('survey in surveys'))
    surveys.then (surveys) ->
      index = surveys.length - 1
      my_survey_name = surveys[index].findElement(By.css('.title')).getText()
      my_survey_results = surveys[index].findElement(By.css('.results a'))
      my_survey_results.click()
      result_title = $('h1.ng-scope').getText()
      my_survey_name.then (my_survey_name) ->
        expect(my_survey_name).toEqual(survey_name) # Checking that we're viewing the survey the test made in the beginning
        title_should_be = 'Results for ' + my_survey_name
        expect(result_title).toEqual(title_should_be)

  it 'shows the results to all questions in a survey', ->
    # Navigating to last survey
    surveys = ptor.findElements(By.repeater('survey in surveys'))
    surveys.then (surveys) ->
      index = surveys.length - 1
      my_survey_name = surveys[index].findElement(By.css('.title')).getText()
      my_survey_results = surveys[index].findElement(By.css('.results a'))
      my_survey_results.click()

    # Checking that the test-created survey contains three questions and six options
    questions = ptor.findElements(By.repeater('question in result.questions'))
    questions.then (questions) ->
      expect(questions.length).toEqual(3)
      options = ptor.findElements(By.repeater('option in question.options'))
      options.then (options) ->
        expect(options.length).toEqual(6)

    zeroString = '0'
    expect($('.container .question_0 .option_0 .option_count').getText()).toEqual(zeroString)
    expect($('.container .question_0 .option_1 .option_count').getText()).toEqual(zeroString)
    expect($('.container .question_0 .option_2 .option_count').getText()).toEqual(zeroString)
    expect($('.container .question_1 .option_0 .option_count').getText()).toEqual(zeroString)
    expect($('.container .question_0 .option_1 .option_count').getText()).toEqual(zeroString)
    expect($('.container .question_0 .option_2 .option_count').getText()).toEqual(zeroString)


  it 'shows a diagram with the results', ->
    # Navigating to last survey
    $('[survey-title="' + survey_name + '"] .results a').click()
    chart = $('canvas')
    expect(chart.isDisplayed()).toBe(true)


  it 'shows the results to a textbox question', ->
   # PENDING - textbox results aren't showed anywhere yet!

  it 'deletes the survey it made for these tests', ->
    $('[survey-title="' + survey_name + '"] .destroy a').click()


uniqueString = (length) ->
  str = ""
  str += Math.random().toString(36).substr(2) while str.length < length
  str.substr 0, length
