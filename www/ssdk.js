
var exec = require('cordova/exec');

var sharesdk = {
  share:function(value) {
    exec(null, null, "CDVShareSDK", "share", arguments);
  }
};

module.exports = sharesdk;
