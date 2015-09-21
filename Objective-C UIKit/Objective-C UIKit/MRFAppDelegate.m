//
//  MRFAppDelegate.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 08.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFAppDelegate.h"
#import "MRFInfoViewController.h"
#import "MRFInfoModel.h"
#import "MRFArrayModel.h"

#import "UIWindow+MFRExtentions.h"
#import "UIViewController+MRFExtentions.h"

static const NSUInteger kMRFInfoModelCount = 7;

@interface MRFAppDelegate ()

@end

@implementation MRFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;

    MRFInfoViewController *controller = [MRFInfoViewController controller];
    controller.arrayModel = [MRFArrayModel arrayWithModelsCount:kMRFInfoModelCount];
    
    window.rootViewController = controller;
    
    [window makeKeyAndVisible];
    
    return YES;
}

@end
