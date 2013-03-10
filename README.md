express.js middleware for rendering single-page apps on server using phantom.js

This middleware test user agent against known browsers using useragent npm module. If no browser detected it renders the page using phantomjs.

1. Install phantomjs
	
	on mac: brew install phantomjs 
	on ubuntu: sudo apt-get install phantomjs

2. add express-phantom middleware

	var expressPhantom = require("express-phantom");
	app.use(expressPhantom.SEORender);

3. enjoy