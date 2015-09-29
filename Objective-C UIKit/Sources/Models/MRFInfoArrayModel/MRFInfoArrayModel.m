//
//  MRFInfoArrayModel.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 23.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFInfoArrayModel.h"

#import "MRFInfoModel.h"

@interface MRFInfoArrayModel ()

- (void)fillWithModelClass:(Class)modelClass count:(NSUInteger)count;

@end

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
        [self fillWithModelClass:[MRFInfoModel class] count:count];
    }
    
    return self;
}

#pragma mark -
#pragma mark Private

- (void)fillWithModelClass:(Class)modelClass count:(NSUInteger)count {
    for (NSUInteger index = 0; index < count; index++) {
        [self addModel:[modelClass new]];
    }
}

@end
