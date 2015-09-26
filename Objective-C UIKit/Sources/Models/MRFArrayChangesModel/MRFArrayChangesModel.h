//
//  MRFArrayChangesModel.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 24.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, MRFArrayChangesModelState) {
    MRFArrayModelAppendChanges,
    MRFArrayModelDeleteChanges,
    MRFArrayModelMoveChanges
};

@interface MRFArrayChangesModel : NSObject
@property (nonatomic, assign)     MRFArrayChangesModelState state;

+ (instancetype)changesModelWithPosition:(NSIndexPath *)position;

+ (instancetype)changesModelWithMovingPositionFrom:(NSIndexPath *)fromPosition
                                                to:(NSIndexPath *)toPosition;

- (NSIndexPath *)getSourcePosition;

- (NSIndexPath *)getDestinationPosition;

@end
