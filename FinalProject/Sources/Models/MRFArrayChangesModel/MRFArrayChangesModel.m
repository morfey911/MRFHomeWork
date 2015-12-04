//
//  MRFArrayChangesModel.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 24.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFArrayChangesModel.h"

#import "MRFPositionModel.h"
#import "MRFMovingPositionModel.h"

@interface MRFArrayChangesModel ()
@property (nonatomic, assign)   MRFArrayChangesModelState state;

@end

@implementation MRFArrayChangesModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)modelWithState:(MRFArrayChangesModelState)state {
    return [[self alloc] initWithState:state];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithState:(MRFArrayChangesModelState)state {
    self = [super init];
    
    if (self) {
        self.state = state;
    }
    
    return self;
}

@end

@implementation MRFArrayChangesModel (MRFInitializers)

+ (MRFPositionModel *)appendModelWithIndex:(NSUInteger)index {
    return [MRFPositionModel modelWithIndex:index state:MRFArrayModelAppendChanges];
}

+ (MRFPositionModel *)deleteModelWithIndex:(NSUInteger)index {
    return [MRFPositionModel modelWithIndex:index state:MRFArrayModelDeleteChanges];
}

+ (MRFPositionModel *)updateModelWithIndex:(NSUInteger)index {
    return [MRFPositionModel modelWithIndex:index state:MRFArrayModelUpdateChanges];
}

+ (MRFMovingPositionModel *)moveModelFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    return [MRFMovingPositionModel modelWithSourceIndex:fromIndex
                                       destinationIndex:toIndex
                                                  state:MRFArrayModelMoveChanges];
}

@end

@implementation MRFArrayChangesModel (MRFIndexPath)

+ (MRFPositionModel *)appendModelWithIndexPath:(NSIndexPath *)indexPath {
    return [MRFPositionModel modelWithIndexPath:indexPath state:MRFArrayModelAppendChanges];
}

+ (MRFPositionModel *)deleteModelWithIndexPath:(NSIndexPath *)indexPath {
    return [MRFPositionModel modelWithIndexPath:indexPath state:MRFArrayModelDeleteChanges];
}

+ (MRFPositionModel *)updateModelWithIndexPath:(NSIndexPath *)indexPath {
    return [MRFPositionModel modelWithIndexPath:indexPath state:MRFArrayModelUpdateChanges];
}

+ (MRFMovingPositionModel *)moveModelFromIndexPath:(NSIndexPath *)fromIndexPath
                                       toIndexPath:(NSIndexPath *)toIndexPath
{
    return [MRFMovingPositionModel modelWithSourceIndexPath:fromIndexPath
                                       destinationIndexPath:toIndexPath
                                                      state:MRFArrayModelMoveChanges];
}

@end
