describe 'Aktivator', ->
	beforeEach ->
		browser().navigateTo('/')

	it 'basic site', ->
		expect(browser().location().url()).toBe '/' 
		