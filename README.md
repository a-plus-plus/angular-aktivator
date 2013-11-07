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
