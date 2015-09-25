/**
 * exec
 * @param1 function(winParam) {}: A success callback function. Assuming your exec call completes successfully, this function executes along with any parameters you pass to it.
 * @param2 function(error) {}: An error callback function. If the operation does not complete successfully, this function executes with an optional error parameter.
 *
 * @param3 plugin name
 *
 * @param4 objective function
 * @param5   args  :
 *    platformid 新浪微博 = 1, 腾讯微博 = 2, 微信好友 ＝ 22 ，微信朋友圈 ＝ 23
 *    title
 *    content
 *    image url
 * **/


var exec = require('cordova/exec');

var sharesdk = {
  share:function(value) {
    var args = [];
    for(var i=0;i<arguments.length;i++)
    {
      args.push(arguments[i]);
      alert(arguments[i]);
    }
    exec(null, null, "ShareSDK", "share", args);
  }
};

module.exports = sharesdk;
