//
//  MRFInfoArrayModel.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 23.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFInfoArrayModel.h"

#import "MRFInfoModel.h"

@implementation MRFInfoArrayModel

#pragma mark -
#pragma mark Class methods

+ (instancetype)arrayWithModelsCount:(NSUInteger)count {
    return [[self alloc] initWithModelsCount:count];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithModelsCount:(NSUInteger)count {
    self = [super init];
    
    if (self) {
        for (NSUInteger index = 0; index < count; index++) {
            [self addModel:[MRFInfoModel new]];
        }
    }
    
    return self;
}

@end
