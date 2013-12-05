By = protractor.By
describe 'Unlogged views', () ->

	it 'show Surveys', () ->
		browser.get('#/')
		title = element(By.css('h1'))
		expect(title.getText()).toMatch('Surveys')

	it 'show Registration', () ->
		browser.get('#/registration')
		title = element(By.css('.ng-scope'))
		expect(title.getText()).toMatch('Register')

	it 'does not show Tags', () ->
		browser.get('#/tags')
		h2 = element(By.css('h2'))
		expect(h2.getText()).toMatch('Something went wrong!')

	it 'does not show Create Survey', () ->
		browser.get('#/surveys/new')
		h2 = element(By.css('h2'))
		expect(h2.getText()).toMatch('Something went wrong!')

	it 'does not show Edit Survey', () ->
		browser.get('#/surveys/1')
		h2 = element(By.css('h2'))
		expect(h2.getText()).toMatch('Something went wrong!')
