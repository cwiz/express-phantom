phantom = require 'phantom'

fullUrl = process.argv[2]

if not fullUrl
	process.stderr.write "no url supplied\n" 
	process.exit!

ph		<- phantom.create '--load-images=no'
page 	<- ph.createPage
status	<- page.open fullUrl

if status is \fail
	process.stderr.write "could not open url\n" 
	process.exit!

page.evaluate (-> document.documentElement.outerHTML), (result) ->
	process.stdout.write result + '\n'
	ph.exit!
