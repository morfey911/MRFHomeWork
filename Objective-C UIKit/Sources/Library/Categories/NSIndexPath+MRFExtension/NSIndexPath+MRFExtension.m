//
//  NSIndexPath+MRFExtension.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 22.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "NSIndexPath+MRFExtension.h"

static const NSUInteger kMRFDefaultSectionCount = 0;

@implementation NSIndexPath (MRFExtension)

+ (instancetype)indexPathForRow:(NSUInteger)count {
    return [self indexPathForRow:count inSection:kMRFDefaultSectionCount];
}

@end
