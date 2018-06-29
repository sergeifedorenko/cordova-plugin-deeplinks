var exec = require('cordova/exec');
var PLUGIN_NAME = 'DeeplinkPlugin';

var DeeplinkPlugin = {
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

module.exports = DeeplinkPlugin;