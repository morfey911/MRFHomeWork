//
//  MRFPositionModel.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 26.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFPositionModel.h"

#import "NSIndexPath+MRFExtension.h"

@interface MRFPositionModel ()
@property (nonatomic, assign)   NSUInteger  index;

@end

@implementation MRFPositionModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)modelWithIndex:(NSUInteger)index state:(MRFArrayChangesModelState)state {
    return [[self alloc] initWithIndex:index state:state];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithIndex:(NSUInteger)index state:(MRFArrayChangesModelState)state {
    self = [super initWithState:state];
    if (self) {
        self.index = index;
    }
    
    return self;
}

@end

@implementation MRFPositionModel (MRFIndexPath)

@dynamic indexPath;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)modelWithIndexPath:(NSIndexPath *)indexPath state:(MRFArrayChangesModelState)state {
    return [self modelWithIndex:indexPath.row state:state];
}

#pragma mark -
#pragma mark Accessors

- (NSIndexPath *)indexPath {
    return [NSIndexPath indexPathForRow:self.index];
}

@end
