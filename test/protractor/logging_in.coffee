'use strict'
By = protractor.By
describe 'Logging in', ->
	describe 'Initially at the main page', ->
		name = undefined
		password = undefined
		logout = undefined
		login = undefined
		beforeEach ->
			browser.get('#')
			name = element(By.model('user.name'))
			login = element(By.id('login'))
			logout = element(By.id('logout'))
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

	describe 'Registration', ->
		name = undefined
		password = undefined
		password_confirmation = undefined
		email = undefined
		submit = undefined

		beforeEach ->
			browser.get('#')
			element(By.linkText('Registration')).click()
			#name = element(By.model('user.name'))
			name = 					$('.registration_form input[ng-model=user\\.name')
			password = 				$('.registration_form input[ng-model=user\\.password')
			password_confirmation = $('.registration_form input[ng-model=user\\.password_confirmation')
			email = 				$('.registration_form input[ng-model=user\\.email')
			submit = 				$('.registration_form button')


		it 'has appropriate fields', ->
			expect(name.isDisplayed()).toBe(true)
			expect(password.isDisplayed()).toBe(true)
			expect(password_confirmation.isDisplayed()).toBe(true)
			expect(email.isDisplayed()).toBe(true) 

		it 'can be saved to db', ->
			name.sendKeys('matti')
			email.sendKeys('matti@domain.com')
			password.sendKeys('matinp455w0rd')
			password_confirmation.sendKeys('matinp455w0rd')
			submit.click()

		it 'cannot be given a username that already exists', ->
			#name.sendKeys('matti')
			#errField = $('.registration_form small[ng-show=registration_form\\.name\\.$error\\.usernameVerify')
			#expect(errField.isDisplayed()).toBe(true)





