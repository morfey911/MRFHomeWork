//
//  MRFArrayModelChanges.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 24.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, MRFArrayModelChangesState) {
    MRFArrayModelChangesWithAdd,
    MRFArrayModelChangesWithDelete,
    MRFArrayModelChangesWithMove
};

@interface MRFArrayModelChanges : NSObject
@property (nonatomic, readonly)   NSArray                   *array;
@property (nonatomic, assign)     MRFArrayModelChangesState state;

- (void)addRow:(NSUInteger)row;
- (void)addIndexPath:(NSIndexPath *)path;

@end
