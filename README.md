express-phantom
===============

This middleware tests user agent against known browsers using useragent npm module. If no browser detected it renders the page using phantomjs.

1. Install phantomjs

	On mac:
	```sh
	brew install phantomjs 
	```

	On Ubuntu:
	```sh
	sudo apt-get install phantomjs
```

2. Add express-phantom middleware

	```javascript
	var expressPhantom = require("express-phantom");
	app.use(expressPhantom.SEORender);
	```

3. Enjoy