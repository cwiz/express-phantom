useragent		= require 'useragent'
child_process   = require "child_process"
exec            = child_process.exec

exports.SEORender = (req, res, next) ->

	ua = useragent.is req.headers['user-agent']
	
	if (ua.webkit 			or 
		ua.opera 			or 
		ua.ie 				or 
		ua.chrome 			or 
		ua.safari 			or 
		ua.mobile_safari 	or 
		ua.firefox)

		return next!

	fullUrl = req.protocol + "://" + req.get('host') + req.url;
	(error, stdout, stderr) <- exec "node #{__dirname}/render.js #{fullUrl}"

	return res.send 500 if error
	return res.send 200, stdout
