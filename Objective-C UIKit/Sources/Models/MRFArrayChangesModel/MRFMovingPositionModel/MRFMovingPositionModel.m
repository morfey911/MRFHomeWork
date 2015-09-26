//
//  MRFMovingPositionModel.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 26.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFMovingPositionModel.h"

@implementation MRFMovingPositionModel

#pragma mark -
#pragma Class Methods

+ (instancetype)movingPositionModelWithSourcePosition:(NSIndexPath *)source
                             destinationPosition:(NSIndexPath *)destination
{
    return [[self alloc] initWithSourcePosition:source destinationPosition:destination];
}

#pragma mark -
#pragma mark Public

- (instancetype)initWithSourcePosition:(NSIndexPath *)source
                   destinationPosition:(NSIndexPath *)destination
{
    self = [super init];
    
    if (self) {
        self.sourcePosition = source;
        self.destinationPosition = destination;
    }
    
    return self;
}

- (NSIndexPath *)getSourcePosition {
    return self.sourcePosition;
}

- (NSIndexPath *)getDestinationPosition {
    return self.destinationPosition;
}

@end
