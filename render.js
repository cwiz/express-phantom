(function(){
  var phantom, fullUrl;
  phantom = require('phantom');
  fullUrl = process.argv[2];
  if (!fullUrl) {
    process.stderr.write("no url supplied\n");
    process.exit();
  }
  phantom.create('--load-images=no', function(ph){
    return ph.createPage(function(page){
      return page.open(fullUrl, function(status){
        if (status === 'fail') {
          process.stderr.write("could not open url\n");
          process.exit();
        }
        return page.evaluate(function(){
          return document.documentElement.outerHTML;
        }, function(result){
          process.stdout.write(result + '\n');
          return ph.exit();
        });
      });
    });
  });
}).call(this);
