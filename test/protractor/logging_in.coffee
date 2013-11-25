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
		

	describe 'Registration', ->
		name = undefined
		password = undefined
		password_confirmation = undefined
		email = undefined
		submit = undefined

		beforeEach ->
			browser.get('#')
			element(By.linkText('Registration')).click()
			name = 					$('.registration_form input[ng-model="user.name"]')
			password = 				$('.registration_form input[ng-model="user.password"]')
			password_confirmation = $('.registration_form input[ng-model="user.password_confirmation"]')
			email = 				$('.registration_form input[ng-model="user.email"]')
			submit = 				$('.registration_form button')


		it 'has appropriate fields', ->
			expect(name.isDisplayed()).toBe(true)
			expect(password.isDisplayed()).toBe(true)
			expect(password_confirmation.isDisplayed()).toBe(true)
			expect(email.isDisplayed()).toBe(true) 

		it 'user can be registered', ->
			name.sendKeys('Ronsupihvi')
			email.sendKeys('ronsupihvi@domain.com')
			password.sendKeys('ronsunp455w0rd')
			password_confirmation.sendKeys('ronsunp455w0rd')
			expect(submit.isEnabled()).toBe(true) #TODO expect success message

		it 'cannot be given a username that already exists', ->
			name.sendKeys('Arto')
			errField = $('.registration_form small[ng-show="registration_form.name.$error.usernameVerify"]')
			expect(errField.getText()).toEqual('Username has already been taken.')

		it 'cannot be given a blank username', ->
			email.sendKeys("ismo@omg.lol")
			password.sendKeys('t0P53cr3T')
			password_confirmation.sendKeys('t0P53cr3T')
			expect(submit.isEnabled()).toBe(false)

		it 'cannot be given a username that is less than 3 chars long', ->
			name.sendKeys('XY')
			email.sendKeys('jeejee@domain.com')
			password.sendKeys('roflp455w0rd')
			password_confirmation.sendKeys('roflp455w0rd')
			errField = $('.registration_form small[ng-show="registration_form.name.$error.minlength"]')
			expect(errField.getText()).toEqual('Your name is required to be at least 3 characters.')
			expect(submit.isEnabled()).toBe(false)

		it 'cannot be given a username that is more than 20 chars long', ->
			name.sendKeys('exactly21charactersz!')
			email.sendKeys('jeejee@domain.com')
			password.sendKeys('roflp455w0rd')
			password_confirmation.sendKeys('roflp455w0rd')
			errField = $('.registration_form small[ng-show="registration_form.name.$error.maxlength"]')
			expect(errField.getText()).toEqual('Your name cannot be longer than 20 characters.')
			expect(submit.isEnabled()).toBe(false)

		it 'can be given a username that is exactly 20 chars long', ->
			name.sendKeys('exactly20characters!')
			email.sendKeys('jeejee@domain.com')
			password.sendKeys('roflp455w0rd')
			password_confirmation.sendKeys('roflp455w0rd')
			expect(submit.isEnabled()).toBe(true)

		it 'can be given a username that is exactly 3 chars long', ->
			name.sendKeys('XYZ')
			email.sendKeys('jeejee@domain.com')
			password.sendKeys('roflp455w0rd')
			password_confirmation.sendKeys('roflp455w0rd')
			expect(submit.isEnabled()).toBe(true)		

		it 'cannot be given an e-mail that is arbitrarily long', ->
			name.sendKeys('EmailDude')
			email.sendKeys('mySuperLongAndAwesomeEmailAddessThatIsSuchAJoyToWriteOnRegistrationFormsLikeThis@domain.com')
			password.sendKeys('roflp455w0rd')
			password_confirmation.sendKeys('roflp455w0rd')
			errField = $('.registration_form small[ng-show="registration_form.email.$error.maxlength"]')
			expect(errField.getText()).toEqual('Your e-mail cannot be longer than 60 characters.')
			expect(submit.isEnabled()).toBe(false)

		it 'cannot be given a blank e-mail', ->
			name.sendKeys('Gorilla')
			password.sendKeys('roflp455w0rd')
			password_confirmation.sendKeys('roflp455w0rd')
			expect(submit.isEnabled()).toBe(false)

		it 'cannot be given a blank password', ->
			name.sendKeys('Dolan')
			email.sendKeys('regards@dolain.com')
			expect(submit.isEnabled()).toBe(false)

		it 'cannot be given a password that is less than 8 chars long', ->
			name.sendKeys('Gooby')
			email.sendKeys('onions@domain.com')
			password.sendKeys('seven77')
			password_confirmation.sendKeys('seven77')
			errField = $('.registration_form small[ng-show="registration_form.password.$error.minlength"]')
			expect(errField.getText()).toEqual('Your password is required to be at least 8 characters.')
			expect(submit.isEnabled()).toBe(false)

		it 'can be given a password that is exactly 8 chars long', ->
			name.sendKeys('ItsAMe')
			email.sendKeys('mario@domain.com')
			password.sendKeys('eight888')
			password_confirmation.sendKeys('eight888')
			expect(submit.isEnabled()).toBe(true)

		it 'cannot be given a password that is more than 20 chars long', ->
			name.sendKeys('kvaaaaak')
			email.sendKeys('my_valid_email@domain.com')
			password.sendKeys('twentyonecharslongyay')
			password_confirmation.sendKeys('twentyonecharslongyay')
			errField = $('.registration_form small[ng-show="registration_form.password.$error.maxlength"]')
			expect(errField.getText()).toEqual('Your password cannot be longer than 20 characters.')
			expect(submit.isEnabled()).toBe(false)

		it 'can be given a password that is exactly 20 chars long', ->
			name.sendKeys('tHiRtEeNyRsOlD')
			email.sendKeys('bikermice@mars.com')
			password.sendKeys('imexactlytwentychars')
			password_confirmation.sendKeys('imexactlytwentychars')
			expect(submit.isEnabled()).toBe(true)

		it 'cannot be given a blank password confirmation', ->
			name.sendKeys('Alien')
			email.sendKeys('mars_attacks@earth.com')
			password.sendKeys('ufosandstuff')
			expect(submit.isEnabled()).toBe(false)

		it 'must be given a password confirmation that matches with the given password', ->
			name.sendKeys('CheeseGuy')
			email.sendKeys('edam@cheddar.com')
			password.sendKeys('icanhascheez')
			password_confirmation.sendKeys('icanhascheezz')
			errField = $('.registration_form small[ng-show="registration_form.password_confirmation.$error.passwordVerify"]')
			expect(errField.getText()).toEqual('Passwords do not match.')
			expect(submit.isEnabled()).toBe(false)

		it 'cannot be given an e-mail that is already in use', ->
			# View does not check this yet, so writing this test is pending!
			expect('pending').toEqual('completed')



# name.sendKeys(protractor.Key.TAB) <-- Dis be da wai to send weeeeird keys liek ENTER or CTRL while using Protractor!!1 \o/




