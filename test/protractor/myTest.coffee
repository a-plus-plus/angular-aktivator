By = protractor.By
describe 'Angular-Aktivator views test', () ->

	it 'show Home site', () ->
		browser.get('#/')
		addButton = element(By.tagName('h1'))
		expect(addButton.getText()).toMatch('Allo')

	it 'show Surveys', () ->
		browser.get('#/surveys')
		addButton = element(By.tagName('h1'))
		expect(addButton.getText()).toMatch('Surveys')

	it 'show Tags', () ->
		browser.get('#/tags')
		addButton = element(By.className('ng-scope'))
		expect(addButton.getText()).toMatch('Tags')

	it 'show Registration', () ->
		browser.get('#/registration')
		addButton = element(By.className('ng-scope'))
		expect(addButton.getText()).toMatch('Register')

	it 'show Create Survey', () ->
		browser.get('#/surveys/new')
		addButton = element(By.className('ng-scope'))
		expect(addButton.getText()).toMatch('New survey')
