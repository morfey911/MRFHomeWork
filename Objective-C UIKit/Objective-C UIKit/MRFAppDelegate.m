//
//  MRFAppDelegate.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 08.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFAppDelegate.h"

#import "MRFInfoViewController.h"
#import "MRFInfoArrayModel.h"

#import "UIWindow+MFRExtensions.h"
#import "UIViewController+MRFExtensions.h"

static const NSUInteger kMRFInfoModelCount = 2;

@implementation MRFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;

    MRFInfoViewController *controller = [MRFInfoViewController controller];
    controller.arrayModel = [MRFInfoArrayModel arrayWithModelsCount:kMRFInfoModelCount];
    window.rootViewController = controller;
    
    [window makeKeyAndVisible];
    
    return YES;
}

@end
