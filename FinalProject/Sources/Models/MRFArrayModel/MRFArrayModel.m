//
//  MRFArrayModel.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 18.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFArrayModel.h"

#import "MRFArrayChangesModel.h"

#import "NSMutableArray+MRFExtension.h"

static NSString * const kMRFMutableArray = @"mutableArray";

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
        self.mutableArray = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)array {
    return [self.mutableArray copy];
}

- (NSUInteger)count {
    return self.mutableArray.count;
}

#pragma mark -
#pragma mark Public

- (void)addModel:(id)model {
    [self.mutableArray addObject:model];
    
    [self setState:MRFModelDidChange withObject:[MRFArrayChangesModel appendModelWithIndex:(self.count - 1)]];
}

- (void)removeModel:(id)model {
    NSUInteger index = [self indexOfModel:model];
    
    [self.mutableArray removeObject:model];
    
    [self setState:MRFModelDidChange
        withObject:[MRFArrayChangesModel deleteModelWithIndex:index]];
}

- (void)addModels:(NSArray *)models {
    for (id model in models) {
        [self addModel:model];
    }
}

- (void)insertModel:(id)model atIndex:(NSUInteger)index {
    [self.mutableArray insertObject:model atIndex:index];
    
    [self setState:MRFModelDidChange withObject:[MRFArrayChangesModel appendModelWithIndex:index]];
}

- (void)removeModelAtIndex:(NSUInteger)index {
    [self.mutableArray removeObjectAtIndex:index];
    
    [self setState:MRFModelDidChange withObject:[MRFArrayChangesModel deleteModelWithIndex:index]];
}

- (void)moveModelFromIndex:(NSUInteger)index1 toIndex:(NSUInteger)index2 {
    [self.mutableArray moveObjectFromIndex:index1 toIndex:index2];
    
    [self setState:MRFModelDidChange
        withObject:[MRFArrayChangesModel moveModelFromIndex:index1 toIndex:index2]];
}

- (void)updateModel:(id)model {
    [self setState:MRFModelDidChange
        withObject:[MRFArrayChangesModel updateModelWithIndex:[self indexOfModel:model]]];
}

- (NSUInteger)indexOfModel:(id)model {
    return [self.mutableArray indexOfObject:model];
}

- (id)modelAtIndex:(NSUInteger)index {
    return [self.mutableArray objectAtIndex:index];
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx {
    return [self modelAtIndex:idx];
}

#pragma mark -
#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.mutableArray forKey:kMRFMutableArray];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (self) {
        self.mutableArray = [aDecoder decodeObjectForKey:kMRFMutableArray];
    }
    
    return self;
}

#pragma mark -
#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id __unsafe_unretained [])buffer
                                    count:(NSUInteger)len
{
    return [self.mutableArray countByEnumeratingWithState:state objects:buffer count:len];
}

@end
