#import <Cordova/CDVPlugin.h>

@interface DeeplinkPlugin : CDVPlugin {
    NSMutableArray *_handlers;
    NSURL *deeplinkUrl;
}

- (void) getDeeplink:(CDVInvokedUrlCommand*)command;
- (void) onDeepLink:(CDVInvokedUrlCommand *)command;

- (BOOL) setDeeplinkUrl: (NSURL *)deeplink;
- (void) notifyAllListners;
- (CDVPluginResult *) createPluginResult;

@end
