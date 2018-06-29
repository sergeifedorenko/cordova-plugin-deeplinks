var exec = require('cordova/exec');
var PLUGIN_NAME = 'DeeplinkPlugin';

module.exports = {
    getDeeplink: function() {
        return new Promise(function(resolve, reject) {
            exec (resolve, reject, PLUGIN_NAME, "getDeeplink", []);
        })
    },

    onDeepLink: function(callback) {
        return new Promise(function(resolve) {
            exec (callback, null, PLUGIN_NAME, "onDeepLink", []);
        }).then(callback)
    }
};