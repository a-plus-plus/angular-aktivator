documents @[Google Drive](https://drive.google.com/folderview?id=0B5-DiiaR_VNIc0FoU0xualJ0ZEU&usp=sharing)

[![Gemnasium](https://gemnasium.com/a-plus-plus/angular-aktivator.png)](https://gemnasium.com/a-plus-plus/angular-aktivator)
[![Build Status](https://travis-ci.org/a-plus-plus/angular-aktivator.png)](https://travis-ci.org/a-plus-plus/angular-aktivator)
[![Code Climate](https://codeclimate.com/github/a-plus-plus/angular-aktivator.png)](https://codeclimate.com/github/a-plus-plus/angular-aktivator)

[![Heroku](https://d1lpkba4w1baqt.cloudfront.net/heroku-logo-light-88x31.png)]()
# Setup
### Requirements
* grunt-cli
to download grunt client use following
```bash
	npm install -g grunt-cli 
```
if you don't have access to /usr/local/bin you need to install it on your home folder, use following:
```bash 
	npm install -g grunt-cli  --prefix ~/npm_path
	echo 'export PATH= $PATH:~/npm_path/bin' >> ~/.bashrc
```

### Downloading dependencies
Download Node-dependencies defined in package.json
``` bash
	npm install
```

Download frontend-dependencies defined in bower.json (clean build)
``` bash
  bower install
```

Update frontend-dependencies defined in bower.json (update build)
``` bash
  bower update
  bower prune
```

### Starting server
``` bash
	grunt server
```
this will also watch any changes made on the files and update app accordingly 

## Running tests
### End-to-End tests
after loading node-dependencies you need to install selenium by running
``` bash 
  ./node_modules/protractor/bin/install_selenium_standalone/
```
after installing selenium you need to start server
``` bash
  grunt server
```
open up a new terminal and run
``` bash
  grunt e2e-test
```
### Unit tests
``` bash
  grunt test
```

