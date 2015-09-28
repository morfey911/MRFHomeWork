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
@property (nonatomic, readonly) NSUInteger  sourceIndex;
@property (nonatomic, readonly) NSUInteger  destinationIndex;

+ (instancetype)modelWithSourceIndex:(NSUInteger)sourceIndex
                    destinationIndex:(NSUInteger)destinationIndex
                               state:(MRFArrayChangesModelState)state;

- (instancetype)initWithSourceIndex:(NSUInteger)sourceIndex
                   destinationIndex:(NSUInteger)destinationIndex
                              state:(MRFArrayChangesModelState)state;

@end

@interface MRFMovingPositionModel (MRFIndexPath)
@property (nonatomic, readonly) NSIndexPath *sourceIndexPath;
@property (nonatomic, readonly) NSIndexPath *destinationIndexPath;

+ (instancetype)modelWithSourceIndexPath:(NSIndexPath *)sourceIndexPath
                    destinationIndexPath:(NSIndexPath *)destinationIndexPath
                                   state:(MRFArrayChangesModelState)state;

@end