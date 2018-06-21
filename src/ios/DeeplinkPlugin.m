#import <Cordova/CDVAvailability.h>
#import <Cordova/CDV.h>
#import "DeeplinkPlugin.h"

@implementation DeeplinkPlugin

- (void)pluginInitialize {
    _handlers = [[NSMutableArray alloc] init];
}

- (void)coolMethod:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];

    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (BOOL)handleLink:(NSURL *)url {
    NSLog(@"IonicDeepLinkPlugin: Handle link (internal) %@", url);
    
    _lastEvent = [self createResult:url];
    
    [self sendToJs];
    
    return YES;
}

- (void) sendToJs {
    // Send the last event to JS if we have one
    if (_handlers.count == 0 || _lastEvent == nil) {
        return;
    }
    
    // Iterate our handlers and send the event
    // for (id callbackID in _handlers) {
    //     [self.commandDelegate sendPluginResult:_lastEvent callbackId:callbackID];
    // }
    
    // Clear out the last event
    _lastEvent = nil;
}

- (CDVPluginResult *)createResult:(NSURL *)url {
    NSDictionary* data = @{
                           @"url": [url absoluteString] ?: @"",
                           @"path": [url path] ?: @"",
                           @"queryString": [url query] ?: @"",
                           @"scheme": [url scheme] ?: @"",
                           @"host": [url host] ?: @"",
                           @"fragment": [url fragment] ?: @""
                           };
    
    CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:data];
    [result setKeepCallbackAsBool:YES];
    return result;
}


@end