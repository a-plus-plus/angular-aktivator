'use strict'
By = protractor.By

describe 'Answering a survey', ->
	
	beforeEach ->
		browser.get('#')
		element(By.linkText('Surveys')).click()
		element(By.linkText('Linis 1')).click()


	it 'allows choosing an answer to a radio button question', ->

	it 'allows changing the answer to a radio button question', ->

	it 'allows choosing a single answer to a checkbox question', ->

	it 'allows choosing multiple answers to a checkbox question', ->

	it 'allows unchecking a checkbox answer', ->

	it 'allows answering to a textbox question', ->

	it 'allows leaving a checkbox answer blank', ->

	it 'allows leaving a radio button answer blank', ->

	it 'allows leaving a textbox answer blank', ->



	


