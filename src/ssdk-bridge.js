

var ssdk-bridge = {};

ssdk-bridge.share = function(title,message,images,successCallback)
{
	cordova.exec(successCallback,
		null,
		"ssdk-bridge",
		"share",
		[title,message,images,platform]
	);
}


module.exports = ssdk-bridge;
