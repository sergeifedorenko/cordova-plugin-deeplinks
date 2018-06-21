#import <Cordova/CDVPlugin.h>

@interface DeeplinkPlugin : CDVPlugin {
    // Handlers for URL events
    NSMutableArray *_handlers;
    CDVPluginResult *_lastEvent;
}

- (void)coolMethod:(CDVInvokedUrlCommand*)command;
- (BOOL)handleLink:(NSURL *)url;
- (void)sendToJs;
- (CDVPluginResult*)createResult:(NSURL *)url;

@end
