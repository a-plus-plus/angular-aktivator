'use strict'
By = protractor.By
ptor = protractor.getInstance()

describe 'View surveys', ->

    describe 'Survey filtering', ->

         survey_name = ''

         afterEach ->
           browser.get('#/surveys')
           surveys = ptor.findElements(By.repeater('survey in surveys'))
           surveys.then (surveys) ->
               destroy = surveys[(surveys.length - 1)].findElement(By.css('.destroy a'))
               destroy.click()
           logout()




         beforeEach ->

            browser.get('#')
            login()
            element(By.linkText('Create Survey')).click()
            title =                 element(By.model('survey.title'))
            submit =                element(By.css('.submit'))
            survey_name = uniqueString(20)
            title.sendKeys(survey_name)

            submit.click()

            
          #TODO, after removing seedfile, change length values  
          it 'shows only own surveys', ->
            element(By.linkText('Surveys')).click()
            MySurveys =           element(By.css('.MySurveys'))

            MySurveys.click()
            surveys = ptor.findElements(By.repeater('survey in surveys'))
            surveys.then (surveys) ->
              i = 0
              length = surveys.length
              while i < length
                expect(surveys.length).toBe 4
                i++


          it 'shows all surveys', ->
            surveys = ptor.findElements(By.repeater('survey in surveys'))
            surveys.then (surveys) ->
              i = 0
              length = surveys.length
              while i < length
                expect(surveys.length).toBe 5
                i++

          it 'filters surveys by name', ->
            element(By.css('.searchTitle')).sendKeys(survey_name)
            surveys = ptor.findElements(By.repeater('survey in surveys'))
            surveys.then (surveys) ->
              i = 0
              length = surveys.length
              while i < length
                expect(surveys.length).toBe 1
                i++      
               





























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




