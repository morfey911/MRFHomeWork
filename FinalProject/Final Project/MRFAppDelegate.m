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

#import "ActiveRecordKit.h"
#import "MRFFilling.h"

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

- (void)fillDB {
    for (NSUInteger index = 0; index < 10; index++) {
        MRFFilling *filling = [MRFFilling managedObject];
        filling.mileage = [NSNumber numberWithInt:arc4random_uniform(1000)];
        filling.volume = [NSNumber numberWithInt:arc4random_uniform(20)];
    }
    
    [NSManagedObjectContext saveManagedObjectContext];
}

@end
