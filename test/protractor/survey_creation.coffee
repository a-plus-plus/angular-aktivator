'use strict'
   #element.getDriver().sleep(15000) # sleeps 15s
By = protractor.By
ptor = protractor.getInstance()

login = ->
  element(By.model('user.name')).sendKeys('Arto')
  element(By.model('user.password')).sendKeys('ratebeeR123')
  element(By.id('login')).click()
logout = ->
  element(By.id('logout')).click()
describe 'Create survey', ->



    describe 'Survey', ->
        title = undefined
        status = undefined
        submit = undefined
        newQuestion = undefined
        removeQuestion = undefined
        newOption = undefined
        removeOption = undefined


        beforeEach ->
            #ptor = protractor.getInstance()
            browser.get('#')
            # loginArr = ptor.findElements(By.id('login'))
            # loginArr.then (loginArr) ->
            #   ptor.waitForAngular()
            #   if loginArr.length and loginArr[0].isDisplayed() # @TODO this no works, fix pls
            #     login()
            login()
            element(By.linkText('Create Survey')).click()
            title =                 element(By.model('survey.title'))
            status =                element(By.select('survey.status'))
            submit =                element(By.id('submit'))
            newQuestion =           element(By.id('newQuestion'))
            removeQuestion =        element(By.id('removeQuestion'))
            newOption =             element(By.id('newOption'))
            removeOption =          element(By.id('removeOption'))

        afterEach ->
          logout()



         it 'has appropriate fields', ->
             expect(title.isDisplayed()).toBe(true)
             expect(status.isDisplayed()).toBe(true)

         it 'has appropriate question fields', ->
            newQuestion.click()


            questions = ptor.findElements(By.repeater('question in survey.questions'))
            questions.then (questions) ->
                expect(questions.length).toBe 1

                qtitle = questions[0].findElement(By.textarea('question.title'))
                qkind = questions[0].findElement(By.select('question.kind'))
                expect(qkind.isDisplayed()).toBe true
                expect(qtitle.isDisplayed()).toBe true
                qtitle.sendKeys('HEI OLEN MATTI')

            # questionTitle = element(By.repeater('question in survey.questions').row(0).column('title'))
            # expect(questionTitle.isDisplayed()).toBe(true)

            #commented lines should work according to protractor examples: https://github.com/angular/protractor/blob/master/spec/basic/findelements_spec.js
            #but they throw element not found error

         it 'has appropriate option fields', ->
          newQuestion.click()
          newOption.click()
          options = ptor.findElements(By.repeater('option in question.options'))
          options.then (options) ->
            expect(options.length).toBe 1
            optionvalue = options[0].findElement(By.textarea('option.value'))
            expect(optionvalue.isDisplayed()).toBe true

         it 'status can be changed', ->
            ptor.findElement(protractor.By.css('select option:nth-child(1)')).click()
            status =                element(By.selectedOption('survey.status'))

            expect(status.getText()).toEqual('Published')

         it 'question can be removed', ->
          newQuestion.click()
          removeQuestion.click()

          questions = ptor.findElements(By.repeater('question in survey.questions'))
          questions.then (questions) ->
            expect(questions.length).toBe 0

         it 'option can be removed', ->
          newQuestion.click()
          newOption.click()
          removeOption.click()
          options = ptor.findElements(By.repeater('option in question.options'))
          options.then (options) ->
            expect(options.length).toBe 0












