//describe('angularjs homepage' , function()
//{
//	it('should greet the named user', function()
//	{
		//browser.get('http://www.angularjs.org');
  //      browser.get('http://127.0.0.1:9000/#/');
		
		//element(by.model('yourname')).sendKeys('Julie');

		//var greeting = element(by.binding('yourName'));
		//expect(greeting.getText()).toEqual('Hello Julie!');
//	});

//});
describe ('Angular-Aktivator views test', function()
{
	//beforeEach ->
               
		//browser().navigateTo('/')
     //beforeEach(function() {
      //browser.get('http://www.angularjs.org');

      //todoList = element.all(by.repeater('todo in todos'));
    //});		

	it('show Home site', function()
	{
		//var driver = new webdriver.Builder().build();
		//var webdriver = require('selenium-webdriver');
		//browser.get('http://127.0.0.1:9000/#/');
		browser.get('http://localhost:9000/#/');
		 var addButton = element(by.tagName('h1'));
		 expect(addButton.getText()).toMatch('Allo');

   //     var input = driver.findElement(webdriver.By.tagName('h1'));


	//	browser.get('http://127.0.0.1:9000/#/');
    //    var input = browser.findElement(browser.By.tagName('h1'));
		//expect(browser().location().url()).toBe '/' 

		//browser.findElement('[ng-view] h1');
		//expect(element('[ng-view] h1').text()).toMatch ('/Allo/');
		//expect(element('[ng-view] h1').text()).not().toMatch ('/Hello/')
     });
	it('show Surveys', function()
	{
		browser.get('http://localhost:9000/#/surveys');
        var addButton = element(by.tagName('h1'));
		expect(addButton.getText()).toMatch('Surveys');
     });
	it('show Results', function()
	{
		browser.get('http://localhost:9000/#/results');
        var addButton = element(by.className('ng-scope'));
		expect(addButton.getText()).toMatch('This is the results');
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
     it('show Create Login', function()
	 {
		browser.get('http://localhost:9000/#/login');
		

        var addButton = element(by.tagName('h2'));
		expect(addButton.getText()).toMatch('Please Login');
     });
});
