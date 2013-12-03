'use strict'
By = protractor.By
ptor = protractor.getInstance()
describe 'Logging in', ->
  describe 'Initially at the main page', ->
    name = undefined
    password = undefined
    logout = undefined
    login = undefined
    beforeEach ->
      browser.get('#')
      name =     element(By.model('user.name'))
      login =    element(By.id('login'))
      logout =   element(By.id('logout'))
      password = element(By.model('user.password'))

    it 'button should be visible initially', ->
      expect(login.isDisplayed()).toBe(true)

    it 'logout button should not be visible initally', ->
      expect(logout.isDisplayed()).toBe(false)

    it 'should contain fields for username and password', ->
      expect(name.isDisplayed()).toBe(true)
      expect(password.isDisplayed()).toBe(true)

    it 'should allow inserting of username and password and clicking login', ->
      name.sendKeys('matti')
      password.sendKeys('mattikävikalassa')
      login.click()
      expect(browser.getCurrentUrl()).toMatch(/#\/$/) # still in same url

    it 'should not allow an unregistered user to log in', ->
      name.sendKeys('IDONOTEXIST')
      password.sendKeys('IDONOTEVENHAVEAPASSWORD')
      login.click()
      expect(login.isDisplayed()).toBe(true)
      expect(logout.isDisplayed()).toBe(false)

    it 'should not allow an existing user to log in if password is wrong', ->
      name.sendKeys('Arto')
      password.sendKeys('rateWines123')
      login.click()
      expect(login.isDisplayed()).toBe(true)
      expect(logout.isDisplayed()).toBe(false)

    it 'should allow an existing user to log in', ->
      name.sendKeys('Arto')
      password.sendKeys('ratebeeR123')
      login.click()
      expect(login.isDisplayed()).toBe(false)
      expect(logout.isDisplayed()).toBe(true)

    it 'should allow a logged in user to log out', ->
      logout.click()
      expect(login.isDisplayed()).toBe(true)
      expect(logout.isDisplayed()).toBe(false)
