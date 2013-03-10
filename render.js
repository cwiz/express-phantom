(function(){
  var phantom, fullUrl;
  phantom = require('phantom');
  fullUrl = process.argv[2];
  phantom.create(function(ph){
    return ph.createPage(function(page){
      return page.open(fullUrl, function(status){
        return page.evaluate(function(){
          return document.documentElement.outerHTML;
        }, function(result){
          console.log(result);
          return ph.exit();
        });
      });
    });
  });
}).call(this);
