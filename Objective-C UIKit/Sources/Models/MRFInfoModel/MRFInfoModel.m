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

@interface MRFInfoModel ()
@property (nonatomic, strong)   NSString *string;

@end

@implementation MRFInfoModel

@dynamic image;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.string = [NSString randomStringWithLength:kMRFStringLength];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (UIImage *)image {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Kappa" ofType:@"png"];
    
    return [UIImage imageWithContentsOfFile:path];
}

@end
