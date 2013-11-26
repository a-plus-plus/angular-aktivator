describe('login', function() {
	
	var ptor;

	beforeEach(function() {
		ptor = protractor.getInstance();
		ptor.get('#/');
	})

	it{'finds login button', function () {
		ptor = protractor.getInstance();
		var loginButtonName = ptor.findElements(protractor.By.className('btn.btn-success')).getAttribute(name);

		expect(loginButtonName).toEqual('Login');
	}

	}



})