//
//  AppDelegate.m
//  simulatorLoadFrameworkExample
//
//  Created by Micah T. Moore on 5/21/21.
//

#import "AppDelegate.h"
#import <mach-o/dyld.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    int imageCount = _dyld_image_count();
    for (int i = 0; i < imageCount; i++) {
        NSString *dylibName = [NSString stringWithUTF8String:_dyld_get_image_name(i)];
        if ([dylibName containsString:@"libsimple.dylib"]) {
            NSLog(@"Path of loaded dylib: %@", dylibName);
        }
    }
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
