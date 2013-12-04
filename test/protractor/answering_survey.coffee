'use strict'
By = protractor.By
ptor = protractor.getInstance()
describe 'Answering a survey', ->
  aRadio = undefined
  bRadio = undefined
  cRadio = undefined
  aCheckbox = undefined
  bCheckbox = undefined
  cCheckbox = undefined
  textbox = undefined
  submit = undefined
  survey = ''

  beforeEach ->
    browser.get('#')
    element(By.linkText('Surveys')).click()
    if survey.length > 0
      element(By.linkText(survey)).click()
      aRadio =    $('.question_0 .option_0 input')
      bRadio =    $('.question_0 .option_1 input')
      cRadio =    $('.question_0 .option_2 input')
      aCheckbox = $('.question_1 .option_0 input')
      bCheckbox = $('.question_1 .option_1 input')
      cCheckbox = $('.question_1 .option_2 input')
      textbox =   $('.question_2 textarea')
      submit =    $('.response_form .submit')


  it 'creates a new survey for tests below', ->

    login()

    # Navigating to survey creation
    element(By.linkText('Create Survey')).click()
    newQuestion = element(By.css('.newQuestion'))
    title =       element(By.model('survey.title'))
    submit =      element(By.css('.submit'))

    newSurvey = uniqueString(15)
    title.sendKeys(newSurvey)

    # Selecting status
    statusSelector = $('#survey_status [value="Published"]')
    statusSelector.click()

    # Radio question and options
    newQuestion.click()
    radioOption = $('.question_0 .newOption')
    radioOption.click()
    radioOption.click()
    radioOption.click()

    # Checkbox question and options
    newQuestion.click()

    kindSelector = $('.question_1 .kind_selector [value="Checkbox"]')
    kindSelector.click()

    checkOption = $('.question_1 .newOption')
    checkOption.click()
    checkOption.click()
    checkOption.click()

    # Textbox question
    newQuestion.click()
    kindSelector = $('.question_2 .kind_selector [value="Textfield"]')
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
    logout()



  # Radio button
  it 'allows choosing an answer to a radio button question', ->
    bRadio.click()
    expect(aRadio.isSelected()).toBe(false)
    expect(bRadio.isSelected()).toBe(true)
    expect(cRadio.isSelected()).toBe(false)

  it 'allows changing the answer to a radio button question', ->
    bRadio.click()
    expect(aRadio.isSelected()).toBe(false)
    expect(bRadio.isSelected()).toBe(true)
    expect(cRadio.isSelected()).toBe(false)
    aRadio.click()
    expect(aRadio.isSelected()).toBe(true)
    expect(bRadio.isSelected()).toBe(false)
    expect(cRadio.isSelected()).toBe(false)
    cRadio.click()
    expect(aRadio.isSelected()).toBe(false)
    expect(bRadio.isSelected()).toBe(false)
    expect(cRadio.isSelected()).toBe(true)



  # Checkbox
  it 'allows choosing a single answer to a checkbox question', ->
    cCheckbox.click()
    expect(aCheckbox.isSelected()).toBe(false)
    expect(bCheckbox.isSelected()).toBe(false)
    expect(cCheckbox.isSelected()).toBe(true)

  it 'allows choosing multiple answers to a checkbox question', ->
    aCheckbox.click()
    bCheckbox.click()
    expect(aCheckbox.isSelected()).toBe(true)
    expect(bCheckbox.isSelected()).toBe(true)
    expect(cCheckbox.isSelected()).toBe(false)

  it 'allows unchecking a checkbox answer', ->
    aCheckbox.click()
    expect(aCheckbox.isSelected()).toBe(true)
    aCheckbox.click()
    expect(aCheckbox.isSelected()).toBe(false)
    expect(bCheckbox.isSelected()).toBe(false)
    expect(cCheckbox.isSelected()).toBe(false)



  # Textbox
  it 'allows answering to a textbox question', ->
    box = element(By.tagName('textarea'))
    box.click()
    box.sendKeys('Joo, emt. Kotona ehkä tai sitten ei.')
    expect(box.getAttribute('value')).toEqual('Joo, emt. Kotona ehkä tai sitten ei.')

  it 'allows answering to a textbox question with 1000 chars', ->
    str = ""
    for i in [1..1000] by 1
      str+="a"
    box = element(By.tagName('textarea'))
    box.click()
    box.sendKeys(str)
    expect(box.getAttribute('value')).toEqual(str)

  it 'will not allow answering to a textbox question with 1001 chars', ->
    str = ""
    for i in [1..1000] by 1
      str+="a"
    box = element(By.tagName('textarea'))
    box.click()
    box.sendKeys(str + "a")
    expect(box.getAttribute('value')).toEqual(str)



#   # General tests
  it 'allows the submitting of the response form', ->
    aRadio.click()
    bCheckbox.click()
    cCheckbox.click()
    textbox.click()
    textbox.sendKeys('gooby pls')
    submit.click()
    msg = $('.message:first-child')
    expect(msg.getText()).toBe('Your response was saved successfully!')


  it 'changes the results of a survey after a successful submit', ->

    # Navigating to our survey's results
    browser.get('#')
    element(By.linkText('Surveys')).click()
    $('[survey-title="' + survey + '"] .results a').click()

    # Saving current radio answer values
    radio1 = $('.container .question_0 .option_0 .option_count').getText()
    radio2 = $('.container .question_0 .option_1 .option_count').getText()
    radio3 = $('.container .question_0 .option_2 .option_count').getText()

    # Saving current checkbox answer values
    check1 = $('.container .question_1 .option_0 .option_count').getText()
    check2 = $('.container .question_1 .option_1 .option_count').getText()
    check3 = $('.container .question_1 .option_2 .option_count').getText()

    # Saving current textbox answer count
    text_button = $('.container .question_2 .btn .count').getText()

    # Answering the last survey
    element(By.linkText('Surveys')).click()
    element(By.linkText(survey)).click()
    bRadio.click()
    aCheckbox.click()
    cCheckbox.click()
    textbox.click()
    textbox.sendKeys('cheezburgrs, plz')
    submit.click()

    # Saving updated radio values from results view
    radio1Updated = $('.container .question_0 .option_0 .option_count').getText()
    radio2Updated = $('.container .question_0 .option_1 .option_count').getText()
    radio3Updated = $('.container .question_0 .option_2 .option_count').getText()

    # Saving updated checkbox values from results view
    check1Updated = $('.container .question_1 .option_0 .option_count').getText()
    check2Updated = $('.container .question_1 .option_1 .option_count').getText()
    check3Updated = $('.container .question_1 .option_2 .option_count').getText()

    # Saving updated textbox answer count from results view
    text_button_updated = $('.container .question_2 .btn .count').getText()

    # Comparing original values to updated ones
    expect(radio1Updated).toBe(radio1)
    radio2.then (bR)->
      expect(radio2Updated).toEqual(getIncrement(bR))
    expect(radio3Updated).toBe(radio3)
    check1.then (aC)->
      expect(check1Updated).toEqual(getIncrement(aC))
    expect(check2Updated).toBe(check2)
    check3.then (cC)->
      expect(check3Updated).toEqual(getIncrement(cC))
    text_button.then (txt) ->
      expect(text_button_updated).toBe(getIncrement(txt))


  it 'does not allow leaving a radio button answer blank', ->
    # Code has no such validation yet!
    #expect('pending').toBe('completed')

  it 'deletes the survey created for these tests', ->
    element(By.linkText('Surveys')).click()
    login()
    $('[survey-title="' + survey + '"] .destroy a').click()
    logout()


# Helper function for it 'changes the results of a survey after a successful submit'
getIncrement = (str) ->
  (parseInt(str)+1)+""

uniqueString = (length) ->
  str = ""
  str += Math.random().toString(36).substr(2) while str.length < length
  str.substr 0, length

login = () ->
  element(By.model('user.name')).sendKeys('Arto')
  element(By.model('user.password')).sendKeys('ratebeeR123')
  element(By.id('login')).click()

logout = () ->
  element(By.id('logout')).click()

  # TODO a test that checks that a radio button question must be answered - code doesn't have this validation yet!
