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
#import "NSIndexPath+MRFExtension.h"

static NSString * const kMRFFilePath = @"/tmp/mrfTempFile";

@interface MRFArrayModel ()
@property (nonatomic, strong)   NSMutableArray  *mutableArray;

- (void)changePositionWithIndex:(NSUInteger)index state:(MRFArrayChangesModelState)state;

- (void)changeMovingPositionWithSourceIndex:(NSUInteger)sourceIndex
                           destinationIndex:(NSUInteger)destinationIndex
                                      state:(MRFArrayChangesModelState)state;

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

#pragma mark -
#pragma mark Public

- (void)addModel:(id)model {
    [self.mutableArray addObject:model];
    
    [self changePositionWithIndex:([self count] - 1)
                               state:MRFArrayModelAppendChanges];
}

- (void)removeModel:(id)model {
    NSUInteger position = [self.mutableArray indexOfObject:model];
    
    [self.mutableArray removeObject:model];

    [self changePositionWithIndex:position state:MRFArrayModelDeleteChanges];
}

- (void)insertModel:(id)model atIndex:(NSUInteger)index {
    [self.mutableArray insertObject:model atIndex:index];
    
    [self changePositionWithIndex:index state:MRFArrayModelAppendChanges];
}

- (void)removeModelAtIndex:(NSUInteger)index {
    [self.mutableArray removeObjectAtIndex:index];
    
    [self changePositionWithIndex:index state:MRFArrayModelDeleteChanges];
}

- (void)moveModelFromIndex:(NSUInteger)index1 toIndex:(NSUInteger)index2 {
    [self.mutableArray moveObjectFromIndex:index1 toIndex:index2];
    
    [self changeMovingPositionWithSourceIndex:index1 destinationIndex:index2 state:MRFArrayModelMoveChanges];
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


- (void)loadArrayFromFile {
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
        sleep(4);
        
        MRFArrayModel *arrayModel = [NSKeyedUnarchiver unarchiveObjectWithFile:kMRFFilePath];
        
        if (arrayModel) {
            self.mutableArray = arrayModel.mutableArray;
        }
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.state = MRFArrayModelLoaded;
        });
    });
}

- (void)saveArrayToFile {
    [NSKeyedArchiver archiveRootObject:self toFile:kMRFFilePath];
}

#pragma mark -
#pragma mark Private

- (void)changePositionWithIndex:(NSUInteger)position state:(MRFArrayChangesModelState)state {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:position];
    
    MRFArrayChangesModel *changes = [MRFArrayChangesModel changesModelWithPosition:indexPath];
    changes.state = state;
    
    [self setState:MRFArrayModelDidChange withObject:changes];
}

- (void)changeMovingPositionWithSourceIndex:(NSUInteger)sourceIndex
                           destinationIndex:(NSUInteger)destinationIndex
                                      state:(MRFArrayChangesModelState)state
{
    NSIndexPath *sourcePath = [NSIndexPath indexPathForRow:sourceIndex];
    NSIndexPath *destinationPath = [NSIndexPath indexPathForRow:destinationIndex];
    
    MRFArrayChangesModel *changes = [MRFArrayChangesModel changesModelWithMovingPositionFrom:sourcePath
                                                                                          to:destinationPath];
    changes.state = state;
    
    [self setState:MRFArrayModelDidChange withObject:changes];
}

#pragma mark -
#pragma mark Observable Object

- (SEL)selectorForState:(NSUInteger)state {
    SEL selector = nil;
    
    switch (state) {
        case MRFArrayModelLoaded:
            selector = @selector(arrayModelDidLoad:);
            break;
            
        case MRFArrayModelDidChange:
            selector = @selector (arrayModel:didChangeWithObject:);
            break;
            
        default:
            break;
    }
    
    return selector;
}

#pragma mark -
#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_mutableArray forKey:@"array"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (self) {
        _mutableArray = [aDecoder decodeObjectForKey:@"array"];
    }
    
    return self;
}

@end
