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

static const NSUInteger kMRFInfoModelCount = 7;

@interface MRFAppDelegate ()
@property (nonatomic, strong)   MRFInfoArrayModel   *arrayModel;
@end

@implementation MRFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;

    MRFInfoViewController *controller = [MRFInfoViewController controller];
    
    MRFInfoArrayModel *arrayModel = [NSKeyedUnarchiver unarchiveObjectWithFile:@"/tmp/mrf"];
    
    if (!arrayModel) {
        arrayModel = [MRFInfoArrayModel arrayWithModelsCount:kMRFInfoModelCount];
    }

    self.arrayModel = arrayModel;
    controller.arrayModel = arrayModel;
    
    window.rootViewController = controller;
    
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [NSKeyedArchiver archiveRootObject:self.arrayModel toFile:@"/tmp/mrf"];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [NSKeyedArchiver archiveRootObject:self.arrayModel toFile:@"/tmp/mrf"];
}

@end
