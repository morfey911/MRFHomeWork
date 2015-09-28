//
//  MRFMovingPositionModel.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 26.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFMovingPositionModel.h"

#import "NSIndexPath+MRFExtension.h"

@interface MRFMovingPositionModel ()
@property (nonatomic, assign)   NSUInteger  sourceIndex;
@property (nonatomic, assign)   NSUInteger  destinationIndex;

@end

@implementation MRFMovingPositionModel

#pragma mark -
#pragma Class Methods

+ (instancetype)modelWithSourceIndex:(NSUInteger)sourceIndex
                    destinationIndex:(NSUInteger)destinationIndex
                               state:(MRFArrayChangesModelState)state
{
    return [[self alloc] initWithSourceIndex:sourceIndex
                            destinationIndex:destinationIndex
                                       state:state];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithSourceIndex:(NSUInteger)sourceIndex
                   destinationIndex:(NSUInteger)destinationIndex
                              state:(MRFArrayChangesModelState)state
{
    self = [super initWithState:state];
    if (self) {
        self.sourceIndex = sourceIndex;
        self.destinationIndex = destinationIndex;
    }
    
    return self;
}

@end

@implementation MRFMovingPositionModel (MRFIndexPath)

@dynamic sourceIndexPath;
@dynamic destinationIndexPath;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)modelWithSourceIndexPath:(NSIndexPath *)sourceIndexPath
                    destinationIndexPath:(NSIndexPath *)destinationIndexPath
                                   state:(MRFArrayChangesModelState)state
{
    return [self modelWithSourceIndex:sourceIndexPath.row
                     destinationIndex:destinationIndexPath.row
                                state:state];
}

#pragma mark -
#pragma mark Accessors

- (NSIndexPath *)sourceIndexPath {
    return [NSIndexPath indexPathForRow:self.sourceIndex];
}

- (NSIndexPath *)destinationIndexPath {
    return [NSIndexPath indexPathForRow:self.destinationIndex];
}

@end
