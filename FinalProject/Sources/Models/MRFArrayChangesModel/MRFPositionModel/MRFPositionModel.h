//
//  MRFPositionModel.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 26.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MRFArrayChangesModel.h"

@interface MRFPositionModel : MRFArrayChangesModel
@property (nonatomic, readonly) NSUInteger  index;

+ (instancetype)modelWithIndex:(NSUInteger)index state:(MRFArrayChangesModelState)state;

- (instancetype)initWithIndex:(NSUInteger)index state:(MRFArrayChangesModelState)state;

@end

@interface MRFPositionModel (MRFIndexPath)
@property (nonatomic, readonly) NSIndexPath *indexPath;

+ (instancetype)modelWithIndexPath:(NSIndexPath *)indexPath state:(MRFArrayChangesModelState)state;

@end
