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
#import "MRFStatisticViewController.h"

#import "UIWindow+MFRExtensions.h"
#import "UIViewController+MRFExtensions.h"

#import "ActiveRecordKit.h"
#import "MRFFilling.h"

@implementation MRFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;
    
    [IDPCoreDataManager sharedManagerWithMomName:@"CarFillings"];
    
    UITabBarController *tabBarController = [UITabBarController new];
    
    MRFMainViewController *mainViewController = [MRFMainViewController controller];
    MRFStatisticViewController *statisticViewController = [MRFStatisticViewController controller];
    
    UINavigationController *mainViewNavigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:mainViewController];
    UINavigationController *statisticNavigationController = [[UINavigationController alloc]
                                                             initWithRootViewController:statisticViewController];
    
    tabBarController.viewControllers = @[mainViewNavigationController, statisticNavigationController];
    window.rootViewController = tabBarController;
    
    [window makeKeyAndVisible];
    
    return YES;
}

@end
