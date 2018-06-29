var exec = require('cordova/exec');
var PLUGIN_NAME = 'DeeplinkPlugin';

module.exports = {
    /**
     * Get deeplink
     */
    getDeeplink: function() {
        return new Promise(function(resolve, reject) {
            exec (resolve, reject, PLUGIN_NAME, "getDeeplink", []);
        })
    },
  
    /**
     * Subscribe to the deeplink event
     */
    onDeepLink: function(callback) {
        return new Promise(function(resolve) {
            exec (resolve, null, PLUGIN_NAME, "onDeepLink", []);
        }).then(callback)
    }
};