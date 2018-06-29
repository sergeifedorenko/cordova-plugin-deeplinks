Deeplinks Plugin
======


## Installation

```bash
cordova plugin add https://github.com/sergeifedorenko/cordova-plugin-deeplinks.git --variable URL_SCHEME=myapp
```
`URL_SCHEME` - the custom URL scheme you'd like to use for your app. You will be able to open app using links like `myapp://home`

## Methods

Get deeplink

```javascript
window.deeplinkPlugin.getDeeplink()
    .then(function (deeplink) {
        console.log('Deeplink: ' + deeplink);
    });
```

Subscribe to the deeplink event

```javascript
function iosAppOpened(deeplink) {
   console.log('Deeplink: ' + deeplink);
}

window.deeplinkPlugin.onDeepLink(iosAppOpened)
```

