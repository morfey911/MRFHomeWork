//
//  MRFAppDelegate.m
//  Final Project
//
//  Created by Yurii Mamurko on 09.11.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "IDPCoreDataManager.h"

#import "MRFAppDelegate.h"

#import "MRFMainViewController.h"

#import "UIWindow+MFRExtensions.h"
#import "UIViewController+MRFExtensions.h"

@implementation MRFAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;
    
    [IDPCoreDataManager sharedManagerWithMomName:@"CarFillings"];
    
    MRFMainViewController *controller = [MRFMainViewController controller];
    UINavigationController *navigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:controller];
    
    window.rootViewController = navigationController;
    
    [window makeKeyAndVisible];
    
    return YES;
}

@end
