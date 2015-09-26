//
//  MRFPositionModel.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 26.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFPositionModel.h"

@implementation MRFPositionModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)positionModelWithPosition:(NSIndexPath *)position {
    return [[self alloc] initWithPosition:position];
}

#pragma mark -
#pragma mark Public

- (instancetype)initWithPosition:(NSIndexPath *)position {
    self = [super init];
    
    if (self) {
        self.position = position;
    }
    
    return self;
}

- (NSIndexPath *)getSourcePosition {
    return self.position;
}

@end
