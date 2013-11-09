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
Downloads dependencies defined in package.json
``` bash
	npm install
```

### Starting server
``` bash
	grunt server
```
this will also watch any changes made on the files and update app accordingly 
