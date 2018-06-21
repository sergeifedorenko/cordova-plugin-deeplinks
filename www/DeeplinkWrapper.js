function DeeplinkWrapper() {
    'use strict';
}

DeeplinkWrapper.prototype.getCordovaURIFRomIntent = function(successCallback, failureCallback) {
    'use strict';

    return cordova.exec (
        successCallback,
        failureCallback,
        "DeeplinkWrapper",
        "getUriFromIntent",
        []
    );
};


var deepLinks = new DeeplinkWrapper();
module.exports = deepLinks;

// Make plugin work under window.plugins
if (!window.plugins) {
    window.plugins = {};
}
if (!window.plugins.deepLinks) {
    window.plugins.deepLinks = deepLinks;
}