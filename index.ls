child_process   = require "child_process"
exec            = child_process.exec
useragent		= require 'useragent'

exports.SEORender = (req, res, next, params) ->

	ua = useragent.is req.headers['user-agent']
	
	return next! if (	ua.webkit 			or 
						ua.opera 			or 
						ua.ie 				or 
						ua.chrome 			or 
						ua.safari 			or 
						ua.mobile_safari 	or 
						ua.firefox )

	fullUrl  = req.protocol + "://" + req.get('host') + req.url
	cacheKey = "cache-url-#{fullUrl}"

	if params.redisClient
		(error, result) <- params.redisClient.get cacheKey
		return res.send 200, result if result

	(error, stdout, stderr) <- exec "node #{__dirname}/render.js #{fullUrl}"
	return res.send 500 if (error or stderr)
	
	if params.redisClient
		params.redisClient.set 		cacheKey, stdout
		params.redisClient.expire   cacheKey, (params.TTL or 3600)
	
	return res.send 200, stdout
