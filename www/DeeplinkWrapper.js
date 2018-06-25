    function DeeplinkWrapper() {
        'use strict';
    }

    DeeplinkWrapper.prototype.getCordovaURIFRomIntent = function(successCallback, failureCallback) {
        'use strict';

        return new Promise(function(resolve, reject) {
            cordova.exec (
                resolve,
                reject,
                "DeeplinkWrapper",
                "getUriFromIntent",
                []
            );
        })
    };

    DeeplinkWrapper.prototype.coolMethod = function(arg0, successCallback, failureCallback) {
        'use strict';

        return cordova.exec (
            successCallback,
            failureCallback,
            "DeeplinkWrapper",
            'coolMethod',
            [arg0]
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

