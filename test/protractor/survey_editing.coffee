'use strict'
   #element.getDriver().sleep(15000) # sleeps 15s
By = protractor.By
ptor = undefined
describe 'Edit survey', ->
    logged = false


    describe 'Survey', ->
        title = undefined
        status = undefined
        submit = undefined
        newQuestion = undefined
        removeQuestion = undefined
        newOption = undefined
        removeOption = undefined
        edit = undefined


        beforeEach ->
            ptor = protractor.getInstance()
            browser.get('#')
            #login if not logged in already
            if !logged #!element(By.id('login')).isVisible()
              element(By.model('user.name')).sendKeys('Arto')
              element(By.model('user.password')).sendKeys('ratebeeR123')
              element(By.id('login')).click()
              logged = true
            #move to survey creation and create new survey
            element(By.linkText('Create Survey')).click()
            newQuestion =           element(By.id('newQuestion'))
            newOption =             element(By.id('newOption'))
            title =                 element(By.model('survey.title'))
            submit =                element(By.id('submit'))
            newQuestion.click()
            newOption.click()

            questions = ptor.findElements(By.repeater('question in survey.questions'))
            questions.then (questions) ->
                expect(questions.length).toBe 1
                qtitle = questions[0].findElement(By.textarea('question.title'))
                qtitle.sendKeys('Toimiiko testi?')
            title.sendKeys("Testikysely")

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
               edit = surveys[(surveys.length-1)].findElement(By.id('edit'))
               #move to survey edit view

               edit.click()

            removeQuestion =        element(By.id('removeQuestion'))
            removeOption =          element(By.id('removeOption'))


         it 'question can be removed', ->
          protractor.getInstance().sleep(15000)
          removeQuestion.click()
          submit =                element(By.id('submit'))
          submit.click()

          surveys = ptor.findElements(By.repeater('survey in surveys'))
          surveys.then (surveys) ->
              edit = surveys[(surveys.length-1)].findElement(By.id('edit'))
               #move to survey edit view
              edit.click()

          questions = ptor.findElements(By.repeater('question in survey.questions'))
          questions.then (questions) ->
              expect(questions.length).toBe 0

         # it 'option can be removed', ->
         #  removeOption.click()
         #  submit =                element(By.id('submit'))
         #  submit.click()

         #  surveys = ptor.findElements(By.repeater('survey in surveys'))
         #  surveys.then (surveys) ->
         #       edit = surveys[(surveys.length-1)].findElement(By.id('edit'))
         #         #move to survey edit view
         #       edit.click()

         #  options = ptor.findElements(By.repeater('option in question.options'))
         #  options.then (options) ->
         #      expect(options.length).toBe 0



