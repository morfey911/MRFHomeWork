//
//  MRFAppDelegate.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 08.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFAppDelegate.h"
#import "MRFSquareViewController.h"
#import "MRFInfoViewController.h"
#import "UIWindow+MFRExtentions.h"
#import "UIViewController+MRFExtentions.h"
#import "MRFInfoModel.h"
#import "MRFArrayModel.h"

static const NSUInteger kMRFInfoModelCount = 100;

@interface MRFAppDelegate ()

@end

@implementation MRFAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;
    
    MRFArrayModel *arrayModel = [MRFArrayModel new];
    
    for (NSUInteger index = 0; index < kMRFInfoModelCount; index++) {
        [arrayModel addModel:[MRFInfoModel new]];
    }
    
    MRFInfoViewController *controller = [MRFInfoViewController new];
    controller.arrayModel = arrayModel;
    
    window.rootViewController = controller;
    
    [window makeKeyAndVisible];
    
    return YES;
}

@end
