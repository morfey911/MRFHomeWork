//
//  MRFArrayModel.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 18.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFArrayModel.h"

#import "MRFArrayModelChanges.h"

#import "NSMutableArray+MRFExtension.h"

@interface MRFArrayModel ()
@property (nonatomic, strong)   NSMutableArray  *mutableArray;

@end

@implementation MRFArrayModel

@dynamic array;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.mutableArray = [NSMutableArray new];
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
    
    MRFArrayModelChanges *changes = [[MRFArrayModelChanges alloc] init];
    [changes addRow:(self.mutableArray.count - 1)];
    changes.state = MRFArrayModelAppendChanges;
    
    [self setState:MRFArrayModelDidChange withObject:changes];
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

- (void)moveModelFromIndex:(NSUInteger)index1 toIndex:(NSUInteger)index2 {
    [self.mutableArray moveObjectFromIndex:index1 toIndex:index2];
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

- (SEL)selectorForState:(NSUInteger)state {
    SEL selector = nil;
    
    switch (state) {
        case MRFArrayModelDidChange:
            selector = @selector (arrayModel:didChangeWithObject:);
            break;
            
        default:
            break;
    }
    
    return selector;
}


@end
