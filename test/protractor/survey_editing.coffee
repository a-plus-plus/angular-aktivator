'use strict'
By = protractor.By
ptor = protractor.getInstance()

describe 'Edit survey', ->

    describe 'Survey', ->
        title = undefined
        status = undefined
        submit = undefined
        newQuestion = undefined
        removeQuestion = undefined
        newOption = undefined
        removeOption = undefined
        edit = undefined
        survey_name = ''

        afterEach ->
          browser.get('#')
          surveys = ptor.findElements(By.repeater('survey in surveys'))
          surveys.then (surveys) ->
              destroy = surveys[(surveys.length - 1)].findElement(By.css('.destroy a'))
              destroy.click()
          logout()


        beforeEach ->
            ptor = protractor.getInstance()
            browser.get('#')
            login()
            element(By.linkText('Create Survey')).click()
            newQuestion =           element(By.css('.newQuestion'))
            newOption =             element(By.css('.newOption'))
            title =                 element(By.model('survey.title'))
            submit =                element(By.css('.submit'))
            newQuestion.click()
            newOption.click()

            questions = ptor.findElements(By.repeater('question in survey.questions'))
            questions.then (questions) ->
                expect(questions.length).toBe 1
                qtitle = questions[0].findElement(By.textarea('question.title'))
                qtitle.sendKeys('Toimiiko testi?')
            survey_name = uniqueString(20)
            title.sendKeys(survey_name)


            options = ptor.findElements(By.repeater('option in question.options'))
            options.then (options) ->
                expect(options.length).toBe 1
                optionvalue = options[0].findElement(By.textarea('option.value'))
                optionvalue.sendKeys('Ei varmasti.')

            submit.click()

            #move to surveys view after submitting newly created survey
            element(By.linkText('Surveys')).click()


            surveys = ptor.findElements(By.repeater('survey in surveys'))
            surveys.then (surveys) ->
               edit = surveys[(surveys.length - 1)].findElement(By.css('.edit a'))
               #move to survey edit view

               edit.click()

            removeQuestion =        element(By.css('.removeQuestion'))
            removeOption =          element(By.css('.removeOption'))


         it 'question can be removed', ->
          removeQuestion.click()
          submit = element(By.css('.submit'))
          submit.click()

          # move to survey edit view
          surveys = ptor.findElements(By.repeater('survey in surveys'))
          surveys.then (surveys) ->
              edit = surveys[(surveys.length-1)].findElement(By.css('.edit a'))
              edit.click()
          questions = ptor.findElements(By.repeater('question in survey.questions'))
          questions.then (questions) ->
              expect(questions.length).toBe 0

         it 'option can be removed', ->
          removeOption.click()
          submit = element(By.css('.submit'))
          submit.click()

          # move to survey edit view
          surveys = ptor.findElements(By.repeater('survey in surveys'))
          surveys.then (surveys) ->
               edit = surveys[(surveys.length - 1)].findElement(By.css('.edit a'))
               edit.click()

          options = ptor.findElements(By.repeater('option in question.options'))
          options.then (options) ->
              expect(options.length).toBe 0



login = ->
  element(By.model('user.name')).sendKeys('Arto')
  element(By.model('user.password')).sendKeys('ratebeeR123')
  element(By.id('login')).click()

logout = ->
  element(By.id('logout')).click()

uniqueString = (length) ->
  str = ""
  str += Math.random().toString(36).substr(2) while str.length < length
  str.substr 0, length




