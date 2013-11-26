'use strict'
By = protractor.By

describe 'Answering a survey', ->
	
	beforeEach ->
		browser.get('#')
		element(By.linkText('Surveys')).click()
		element(By.linkText('Linis 1')).click()


	# Radio button
	it 'allows choosing an answer to a radio button question', ->
		a = $('.question:nth-of-type(1) div div:nth-of-type(1)')
		b = $('.question:nth-of-type(1) div div:nth-of-type(2)')
		c = $('.question:nth-of-type(1) div div:nth-of-type(3)')
		a.click()
		protractor.getInstance().findElement(By.css('body')).getDriver().sleep(5000)
		expect(a.isSelected()).toBe(true)
		#expect(b.isSelected()).toBe(false)
		#expect(c.isSelected()).toBe(false)

	# it 'allows changing the answer to a radio button question', ->

	# it 'does not allow leaving a radio button answer blank', ->
	# 	# Code has no such validation yet!
	# 	expect('pending').toBe('completed')


	# # Checkbox
	# it 'allows choosing a single answer to a checkbox question', ->

	# it 'allows choosing multiple answers to a checkbox question', ->

	# it 'allows unchecking a checkbox answer', ->

	# it 'allows leaving a checkbox answer blank', ->


	# # Textbox
	# it 'allows leaving a textbox answer blank', ->	
	# 	expect('pending').toBe('completed')	

	# it 'allows answering to a textbox question', ->
	# 	box = element(By.name('3'))
	# 	box.click()
	# 	box.sendKeys('Joo, emt. Kotona ehkä tai sitten ei.')
	# 	expect(box.getAttribute('value')).toEqual('Joo, emt. Kotona ehkä tai sitten ei.')

	# it 'allows answering to a textbox question with 1000 chars', ->
	# 	str = ""
	# 	for i in [1..1000] by 1
	# 		str+="a"
	# 	box = element(By.name('3'))
	# 	box.click()
	# 	box.sendKeys(str)
	# 	expect(box.getAttribute('value')).toEqual(str)

	# it 'will not allow answering to a textbox question with 1001 chars', ->
	# 	str = ""
	# 	for i in [1..1000] by 1
	# 		str+="a"
	# 	box = element(By.name('3'))
	# 	box.click()
	# 	box.sendKeys(str + "a")
	# 	expect(box.getAttribute('value')).toEqual(str)



	


