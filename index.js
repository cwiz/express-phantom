(function(){
  var phantomProxy, useragent, child_process, exec;
  phantomProxy = require('phantom-proxy');
  useragent = require('useragent');
  child_process = require("child_process");
  exec = child_process.exec;
  exports.SEORender = function(req, res, next){
    var ua, fullUrl;
    ua = useragent.is(req.headers['user-agent']);
    if (ua.webkit || ua.opera || ua.ie || ua.chrome || ua.safari || ua.mobile_safari || ua.firefox) {
      return next();
    }
    fullUrl = req.protocol + "://" + req.get('host') + req.url;
    return exec("node " + __dirname + "/render.js " + fullUrl, function(error, stdout, stderr){
      if (error) {
        return res.send(500);
      }
      return res.send(200, stdout);
    });
  };
}).call(this);
