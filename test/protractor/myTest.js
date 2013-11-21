describe ('Angular-Aktivator views test', function()
{
	it('show Home site', function()
	{
		browser.get('http://localhost:9000/#/');
		 var addButton = element(by.tagName('h1'));
		 expect(addButton.getText()).toMatch('Allo');
    });
	it('show Surveys', function()
	{
		browser.get('http://localhost:9000/#/surveys');
        var addButton = element(by.tagName('h1'));
		expect(addButton.getText()).toMatch('Surveys');
     });
	
	 it('show Tags', function()
	 {
		browser.get('http://localhost:9000/#/tags');
        var addButton = element(by.className('ng-scope'));
		expect(addButton.getText()).toMatch('Tags');
     });

     it('show Registration', function()
	 {
		browser.get('http://localhost:9000/#/registration');
        var addButton = element(by.className('ng-scope'));
		expect(addButton.getText()).toMatch('Register');
     });

     it('show Create Survey', function()
	 {
		browser.get('http://localhost:9000/#/surveys/new');
        var addButton = element(by.className('ng-scope'));
		expect(addButton.getText()).toMatch('New survey');
     });
});
