//
//  MRFArrayModelChanges.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 24.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, MRFArrayModelChangesState) {
    MRFArrayModelAppendChanges,
    MRFArrayModelDeleteChanges,
    MRFArrayModelMoveChanges
};

@interface MRFArrayModelChanges : NSObject
@property (nonatomic, assign)     MRFArrayModelChangesState state;
@property (nonatomic, readonly)   NSArray                   *array;

- (void)addRow:(NSUInteger)row;
- (void)addIndexPath:(NSIndexPath *)path;

@end
