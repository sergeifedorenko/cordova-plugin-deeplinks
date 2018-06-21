#import "AppDelegate+DeeplinkPlugin.h"

static NSString *const PLUGIN_NAME = @"DeeplinkPlugin";

@implementation AppDelegate (DeeplinkPlugin)

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *, id> *)options {
    DeeplinkPlugin *plugin = [self.viewController getCommandInstance:PLUGIN_NAME];
    
    if(plugin == nil) {
        NSLog(@"Unable to get instance of command plugin");
        return NO;
    }
    
    BOOL handled = [plugin handleLink:url];
    
    return true;
}

@end
