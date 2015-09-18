//
//  UIViewController+MRFExtentions.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 15.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "UIViewController+MRFExtentions.h"

@implementation UIViewController (MRFExtentions)

#pragma mark -
#pragma mark Class methods

+ (instancetype)controller {
    return [[self alloc] initWithNibName:[self nibName] bundle:nil];
}

+ (NSString *)nibName {
    return nil;
}

@end
