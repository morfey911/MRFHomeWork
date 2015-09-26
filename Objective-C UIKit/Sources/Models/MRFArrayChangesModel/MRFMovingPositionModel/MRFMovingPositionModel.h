//
//  MRFMovingPositionModel.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 26.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MRFArrayChangesModel.h"

@interface MRFMovingPositionModel : MRFArrayChangesModel
@property (nonatomic, strong)   NSIndexPath *sourcePosition;
@property (nonatomic, strong)   NSIndexPath *destinationPosition;

+ (instancetype)movingPositionModelWithSourcePosition:(NSIndexPath *)source
                             destinationPosition:(NSIndexPath *)destination;

- (instancetype)initWithSourcePosition:(NSIndexPath *)source
                   destinationPosition:(NSIndexPath *)destination;

- (NSIndexPath *)getSourcePosition;
- (NSIndexPath *)getDestinationPosition;

@end
