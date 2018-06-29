#import <Cordova/CDVAvailability.h>
#import <Cordova/CDV.h>
#import "DeeplinkPlugin.h"

@implementation DeeplinkPlugin

- (void)pluginInitialize
{
    _handlers = [[NSMutableArray alloc] init];
}

- (void)getDeeplink:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult *pluginResult = [self createPluginResult];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)onDeepLink:(CDVInvokedUrlCommand *)command {
    [_handlers addObject:command.callbackId];
    
    [self notifyAllListners];
}

- (BOOL)setDeeplinkUrl: (NSURL *)deeplink
{
    deeplinkUrl = deeplink;
    [self notifyAllListners];
    
    return TRUE;
}

- (void) notifyAllListners {
    // Send the last event to JS if we have one
    if (_handlers.count == 0) {
        return;
    }
    
    CDVPluginResult *pluginResult = [self createPluginResult];
    [pluginResult setKeepCallbackAsBool:TRUE];
    // Iterate our handlers and send the event
    for (id callbackID in _handlers) {
        [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackID];
    }
}

- (CDVPluginResult *) createPluginResult {
    NSString *message = nil;
    
    if (deeplinkUrl) {
        message = deeplinkUrl.absoluteString;
    } else {
        message = @"";
    }
    return [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:message];
}

@end
