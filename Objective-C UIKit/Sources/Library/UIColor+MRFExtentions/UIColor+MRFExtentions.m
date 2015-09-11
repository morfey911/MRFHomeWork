//
//  UIColor+MRFExtentions.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 11.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "UIColor+MRFExtentions.h"

#import "MRFRandomValues.h"

@implementation UIColor (MRFExtentions)

#pragma mark -
#pragma mark Class methods

+ (instancetype)randomColor {
    CGFloat r = [MRFRandomValues valueForRGB];
    CGFloat g = [MRFRandomValues valueForRGB];
    CGFloat b = [MRFRandomValues valueForRGB];
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

@end
