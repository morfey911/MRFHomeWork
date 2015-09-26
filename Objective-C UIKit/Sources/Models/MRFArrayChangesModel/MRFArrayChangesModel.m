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

@implementation MRFArrayChangesModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)changesModelWithPosition:(NSIndexPath *)position {
    return [MRFPositionModel positionModelWithPosition:position];
}

+ (instancetype)changesModelWithMovingPositionFrom:(NSIndexPath *)fromPosition
                                                to:(NSIndexPath *)toPosition
{
    return [MRFMovingPositionModel movingPositionModelWithSourcePosition:fromPosition
                                                     destinationPosition:toPosition];
}

- (NSIndexPath *)getSourcePosition {
    return nil;
}

- (NSIndexPath *)getDestinationPosition {
    return nil;
}

@end
