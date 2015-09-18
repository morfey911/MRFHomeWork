//
//  MRFInfoModel.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 18.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFInfoModel.h"
#import "NSString+MRFExtensions.h"

static const NSUInteger kMRFStringLength = 10;

@implementation MRFInfoModel

@dynamic string;
@dynamic image;

#pragma mark -
#pragma mark Accessors

- (NSString *)string {
    return [NSString randomStringWithLength:kMRFStringLength];
}

- (UIImage *)image {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Kappa" ofType:@"png"];
    
    return [UIImage imageWithContentsOfFile:path];
}

@end
