
var exec = require('cordova/exec');

var sharesdk = {
  share:function(value) {
    exec(null, null, "CDVShareSDK", "share", ["aa","bb","cc","dd","eee"]);
  }
};

module.exports = sharesdk;
