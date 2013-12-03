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
      aRadio =    $('.question:nth-of-type(1) div div:nth-of-type(1) input')
      bRadio =    $('.question:nth-of-type(1) div div:nth-of-type(2) input')
      cRadio =    $('.question:nth-of-type(1) div div:nth-of-type(3) input')
      aCheckbox = $('.question:nth-of-type(2) div div:nth-of-type(1) input')
      bCheckbox = $('.question:nth-of-type(2) div div:nth-of-type(2) input')
      cCheckbox = $('.question:nth-of-type(2) div div:nth-of-type(3) input')
      textbox =   $('.question:nth-of-type(3) div div textarea')
      submit =    $('.response_form button')


  it 'creates a new survey for tests below', ->

    # Logging in...
    element(By.model('user.name')).sendKeys('Arto')
    element(By.model('user.password')).sendKeys('ratebeeR123')
    element(By.id('login')).click()

    # Navigating to survey creation
    element(By.linkText('Create Survey')).click()
    newQuestion = element(By.id('newQuestion'))
    title =       element(By.model('survey.title'))
    submit =      element(By.id('submit'))

    newSurvey = uniqueString(15)
    title.sendKeys(newSurvey)

    # Selecting status
    statusSelector = $('#survey_status option:nth-child(1)')
    statusSelector.click()

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

    logout = element(By.id('logout'))
    logout.click()



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



  # General tests
  it 'allows the submitting of the response form', ->
    aRadio.click()
    bCheckbox.click()
    cCheckbox.click()
    textbox.click()
    textbox.sendKeys('gooby pls')
    submit.click()
    msg = $('.message:first-child')
    #expect(msg.getText()).toBe('Your response was saved successfully!')

  # TODO textbox answers!
  it 'changes the results of a survey after a successful submit', ->

    # Navigating to last survey's results
    browser.get('#')
    element(By.linkText('Surveys')).click()
    surveys = ptor.findElements(By.repeater('survey in surveys'))
    surveys.then (surveys) ->
      index = surveys.length - 1
      surveys[index].findElement(By.className('result_button')).click()

    # Saving current radio answer values
    radio1 = $('.container ul:nth-child(2) ul:nth-child(2) li:nth-child(1) h5:nth-child(2)').getText()
    radio2 = $('.container ul:nth-child(2) ul:nth-child(3) li:nth-child(1) h5:nth-child(2)').getText()
    radio3 = $('.container ul:nth-child(2) ul:nth-child(4) li:nth-child(1) h5:nth-child(2)').getText()

    # Saving current checkbox answer values
    check1 = $('.container ul:nth-child(3) ul:nth-child(2) li:nth-child(1) h5:nth-child(2)').getText()
    check2 = $('.container ul:nth-child(3) ul:nth-child(3) li:nth-child(1) h5:nth-child(2)').getText()
    check3 = $('.container ul:nth-child(3) ul:nth-child(4) li:nth-child(1) h5:nth-child(2)').getText()

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
    radio1Updated = $('.container ul:nth-child(2) ul:nth-child(2) li:nth-child(1) h5:nth-child(2)').getText()
    radio2Updated = $('.container ul:nth-child(2) ul:nth-child(3) li:nth-child(1) h5:nth-child(2)').getText()
    radio3Updated = $('.container ul:nth-child(2) ul:nth-child(4) li:nth-child(1) h5:nth-child(2)').getText()
    # Saving updated checkbox values from results view
    check1Updated = $('.container ul:nth-child(3) ul:nth-child(2) li:nth-child(1) h5:nth-child(2)').getText()
    check2Updated = $('.container ul:nth-child(3) ul:nth-child(3) li:nth-child(1) h5:nth-child(2)').getText()
    check3Updated = $('.container ul:nth-child(3) ul:nth-child(4) li:nth-child(1) h5:nth-child(2)').getText()

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


  it 'does not allow leaving a radio button answer blank', ->
    # Code has no such validation yet!
    #expect('pending').toBe('completed')


# Helper function for it 'changes the results of a survey after a successful submit'
getIncrement = (str) ->
  (parseInt(str)+1)+""


uniqueString = (length) ->
  str = ""
  str += Math.random().toString(36).substr(2) while str.length < length
  str.substr 0, length



  # TODO a test that checks that a radio button question must be answered - code doesn't have this validation yet!
  # TODO a test/an update to an existing test that checks that submitting a textbox answer saves it in results
