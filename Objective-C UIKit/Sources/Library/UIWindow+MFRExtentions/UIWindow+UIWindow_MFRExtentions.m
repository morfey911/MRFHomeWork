//
//  UIWindow+UIWindow_MFRExtentions.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 13.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "UIWindow+UIWindow_MFRExtentions.h"

@implementation UIWindow (UIWindow_MFRExtentions)

+ (instancetype)window {
    return [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

@end
