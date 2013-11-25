'use strict'
   #element.getDriver().sleep(15000) # sleeps 15s
By = protractor.By
ptor = undefined
describe 'Create survey', ->
    describe 'Creating survey', ->
        title = undefined
        status = undefined
        submit = undefined
        newQuestion = undefined
        qtitle = undefined

        beforeEach ->
            ptor = protractor.getInstance()
            browser.get('#')
            element(By.linkText('Create Survey')).click()

            title =                 $('.survey_management_form input[ng-model="survey.title"]')
            status =                $('.survey_management_form select[ng-model="survey.status"]')
            submit =                $('.survey_management_form button')
            newQuestion =  $('.survey_management_form button[ng-click="newQuestion($event)"]')


         it 'has appropriate fields', ->
             expect(title.isDisplayed()).toBe(true)
             expect(status.isDisplayed()).toBe(true)
        
        it 'has appropriate question fields', ->
            newQuestion.click()

            questions = ptor.findElements(By.repeater('question in survey.questions'))
            questions.then (questions) ->
                expect(questions.length).toBe 1

                qtitle = questions[0].findElement(By.css('textarea[ng-model="question.title"]'))
                expect(qtitle.isDisplayed()).toBe true
                qtitle.sendKeys('HEI OLEN MATTI')

            # questionTitle = ptor.findElement(By.repeater('question in survey.questions').row(1).column('{{question.title}}'))
            # questionTitle.then (questionTitle) ->
            #     expect(questionTitle.isDisplayed()).toBe(true)    
        
         it 'can be saved to db', ->
             title.sendKeys("Testikysely")
             submit.click()    



  
