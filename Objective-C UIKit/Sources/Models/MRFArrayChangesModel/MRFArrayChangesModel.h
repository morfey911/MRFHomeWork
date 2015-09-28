//
//  MRFArrayChangesModel.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 24.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MRFPositionModel;
@class MRFMovingPositionModel;

typedef NS_ENUM(NSUInteger, MRFArrayChangesModelState) {
    MRFArrayModelAppendChanges,
    MRFArrayModelDeleteChanges,
    MRFArrayModelMoveChanges
};

@interface MRFArrayChangesModel : NSObject
@property (nonatomic, readonly)     MRFArrayChangesModelState state;

+ (instancetype)modelWithState:(MRFArrayChangesModelState)state;

- (instancetype)initWithState:(MRFArrayChangesModelState)state;

@end

@interface MRFArrayChangesModel (MRFInitializers)

+ (MRFPositionModel *)appendModelWithIndex:(NSUInteger)index;
+ (MRFPositionModel *)deleteModelWithIndex:(NSUInteger)index;
+ (MRFMovingPositionModel *)moveModelFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end

@interface MRFArrayChangesModel (MRFIndexPath)

+ (MRFPositionModel *)appendModelWithIndexPath:(NSIndexPath *)indexPath;
+ (MRFPositionModel *)deleteModelWithIndexPath:(NSIndexPath *)indexPath;
+ (MRFMovingPositionModel *)moveModelFromIndexPath:(NSIndexPath *)fromIndexPath
                                       toIndexPath:(NSIndexPath *)toIndexPath;

@end