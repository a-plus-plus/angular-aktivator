describe 'Aktivator', ->
	beforeEach ->
		browser().navigateTo('/')

	it 'Hello site', ->
		expect(browser().location().url()).toBe '/' 
		expect(element('[ng-view] h1').text()).toMatch /Allo/
		expect(element('[ng-view] h1').text()).not().toMatch /Hello/
