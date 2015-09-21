//
//  MRFArrayModel.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 18.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFArrayModel.h"
#import "MRFInfoModel.h"

@interface MRFArrayModel ()
@property (nonatomic, strong)   NSMutableArray  *mutableArray;

@end

@implementation MRFArrayModel

@dynamic array;

#pragma mark -
#pragma mark Class methods

+ (instancetype)arrayWithModelsCount:(NSUInteger)count {
    return [[self alloc] initWithModelsCount:count];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.mutableArray = [NSMutableArray new];
    }
    
    return self;
}

- (instancetype)initWithModelsCount:(NSUInteger)count {
    self = [self init];
    
    if (self) {
        NSMutableArray *array = self.mutableArray;
        
        for (NSUInteger index = 0; index < count; index++) {
            [array addObject:[MRFInfoModel new]];
        }
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)array {
    return [self.mutableArray copy];
}

#pragma mark -
#pragma mark Public

- (void)addModel:(id)model {
    [self.mutableArray addObject:model];
}

- (void)removeModel:(id)model {
    [self.mutableArray removeObject:model];
}

- (void)insertModel:(id)model atIndex:(NSUInteger)index {
    [self.mutableArray insertObject:model atIndex:index];
}

- (void)removeModelAtIndex:(NSUInteger)index {
    [self.mutableArray removeObjectAtIndex:index];
}

- (void)moveModelAtIndex:(NSUInteger)index1 withModelAtIndex:(NSUInteger)index2 {
    id model = [self modelAtIndex:index1];
    
    [self removeModelAtIndex:index1];
    [self insertModel:model atIndex:index2];
}

- (id)modelAtIndex:(NSUInteger)index {
    return [self.mutableArray objectAtIndex:index];
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx {
    return [self modelAtIndex:idx];
}

- (NSUInteger)count {
    return [self.mutableArray count];
}

@end
