#import "AppDelegate.h"

@interface AppDelegate (DeeplinkPlugin)

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *, id> *)options;

@end