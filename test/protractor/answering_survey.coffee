'use strict'
By = protractor.By

describe 'Answering a survey', ->
	aRadio = undefined
	bRadio = undefined
	cRadio = undefined
	aCheckbox = undefined
	bCheckbox = undefined
	cCheckbox = undefined
	textbox = undefined
	submit = undefined
	
	beforeEach ->
		browser.get('#')
		element(By.linkText('Surveys')).click()
		element(By.linkText('Linis 1')).click()
		aRadio =    $('.question:nth-of-type(1) div div:nth-of-type(1) input')
		bRadio =    $('.question:nth-of-type(1) div div:nth-of-type(2) input')
		cRadio =    $('.question:nth-of-type(1) div div:nth-of-type(3) input')
		aCheckbox = $('.question:nth-of-type(2) div div:nth-of-type(1) input')
		bCheckbox = $('.question:nth-of-type(2) div div:nth-of-type(2) input')
		cCheckbox = $('.question:nth-of-type(2) div div:nth-of-type(3) input')
		textbox =   $('.question:nth-of-type(3) div div textarea')
		submit =    $('.response_form button')


	# Radio button
	it 'allows choosing an answer to a radio button question', ->		
		bRadio.click()
		# protractor.getInstance().findElement(By.css('body')).getDriver().sleep(5000)
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

	it 'does not allow leaving a radio button answer blank', ->
		# Code has no such validation yet!
		expect('pending').toBe('completed')


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
		box = element(By.name('3'))
		box.click()
		box.sendKeys('Joo, emt. Kotona ehkä tai sitten ei.')
		expect(box.getAttribute('value')).toEqual('Joo, emt. Kotona ehkä tai sitten ei.')

	it 'allows answering to a textbox question with 1000 chars', ->
		str = ""
		for i in [1..1000] by 1
			str+="a"
		box = element(By.name('3'))
		box.click()
		box.sendKeys(str)
		expect(box.getAttribute('value')).toEqual(str)

	it 'will not allow answering to a textbox question with 1001 chars', ->
		str = ""
		for i in [1..1000] by 1
			str+="a"
		box = element(By.name('3'))
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
		expect(msg.getText()).toBe('Your response was saved successfully!')

	# TODO textbox answers!
	it 'changes the results of a survey after a successful submit', ->

		# Going to results view
		browser.get('#/results/1')	

		# Saving current radio answer values
		radio1 = $('.container ul:nth-child(2) ul:nth-child(2) li:nth-child(1) h5:nth-child(2)').getText()
		radio2 = $('.container ul:nth-child(2) ul:nth-child(3) li:nth-child(1) h5:nth-child(2)').getText()
		radio3 = $('.container ul:nth-child(2) ul:nth-child(4) li:nth-child(1) h5:nth-child(2)').getText()

		# Saving current checkbox answer values
		check1 = $('.container ul:nth-child(3) ul:nth-child(2) li:nth-child(1) h5:nth-child(2)').getText()
		check2 = $('.container ul:nth-child(3) ul:nth-child(3) li:nth-child(1) h5:nth-child(2)').getText()
		check3 = $('.container ul:nth-child(3) ul:nth-child(4) li:nth-child(1) h5:nth-child(2)').getText()

		# Answering a survey
		browser.get('#/answer/1')
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


# Helper function for it 'changes the results of a survey after a successful submit'
getIncrement = (str) ->
	(parseInt(str)+1)+""






	# TODO tests for submitting a radio button, checkboxes and text (allow leaving textbox or checkbox blank, don't allow leaving radio button blank) etc.