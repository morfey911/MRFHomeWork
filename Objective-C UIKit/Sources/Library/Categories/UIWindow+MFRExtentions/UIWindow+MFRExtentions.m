//
//  UIWindow+MFRExtentions.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 14.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "UIWindow+MFRExtentions.h"

@implementation UIWindow (MFRExtentions)

#pragma mark -
#pragma mark Class methods

+ (instancetype)window {
    return [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

@end
