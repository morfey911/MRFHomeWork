//
//  MRFRandomValues.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 11.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFRandomValues.h"

@implementation MRFRandomValues

+ (CGFloat)valueForRGB {
    return ((float)(arc4random_uniform(256)) / 256);
}

@end
