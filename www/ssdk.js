/**
 * exec
 * @param1 function(winParam) {}: A success callback function. Assuming your exec call completes successfully, this function executes along with any parameters you pass to it.
 * @param2 function(error) {}: An error callback function. If the operation does not complete successfully, this function executes with an optional error parameter.
 *
 *
 *
 *
 *
 * **/


var exec = require('cordova/exec');

var sharesdk = {
  share:function(value) {
    exec(null, null, "CDVShareSDK", "share", ["aa","bb","cc","dd","eee"]);
  }
};

module.exports = sharesdk;
