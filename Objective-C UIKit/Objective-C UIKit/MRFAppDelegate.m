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

static const NSUInteger kMRFInfoModelCount = 25;

@interface MRFAppDelegate ()
@property (nonatomic, strong) MRFInfoArrayModel *model;

@end

@implementation MRFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;

    MRFInfoViewController *controller = [MRFInfoViewController controller];
    
    MRFInfoArrayModel *model = [MRFInfoArrayModel arrayWithModelsCount:kMRFInfoModelCount];
    self.model = model;
    controller.arrayModel = model;
    
    window.rootViewController = controller;
    
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self saveApplicationState];
}

#pragma mark -
#pragma mark Private

- (void)saveApplicationState {
    [self.model save];
}

@end
