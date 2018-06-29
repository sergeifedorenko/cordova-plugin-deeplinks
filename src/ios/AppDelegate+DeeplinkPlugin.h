#import "AppDelegate.h"

@interface AppDelegate (deeplink)

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *, id> *)options;

@end
