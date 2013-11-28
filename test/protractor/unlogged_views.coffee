By = protractor.By
describe 'Unlogged views', () ->

	it 'show Home site', () ->
		browser.get('#/')
		addButton = element(By.tagName('h1'))
		expect(addButton.getText()).toMatch('Allo')

	it 'show Surveys', () ->
		browser.get('#/surveys')
		addButton = element(By.tagName('h1'))
		expect(addButton.getText()).toMatch('Surveys')

	it 'show Registration', () ->
		browser.get('#/registration')
		addButton = element(By.className('ng-scope'))
		expect(addButton.getText()).toMatch('Register')		

	it 'does not show Tags', () ->
		browser.get('#/tags')
		h2 = element(By.tagName('h2'))
		expect(h2.getText()).toMatch('Something went wrong!')

	it 'does not show Create Survey', () ->
		browser.get('#/surveys/new')
		h2 = element(By.tagName('h2'))
		expect(h2.getText()).toMatch('Something went wrong!')

	it 'does not show Edit Survey', () ->
		browser.get('#/surveys/1')
		h2 = element(By.tagName('h2'))
		expect(h2.getText()).toMatch('Something went wrong!')		