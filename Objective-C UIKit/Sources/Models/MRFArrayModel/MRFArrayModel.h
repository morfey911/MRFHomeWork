//
//  MRFArrayModel.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 18.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MRFModel.h"

@interface MRFArrayModel : MRFModel <NSCoding, NSFastEnumeration>
@property (nonatomic, readonly) NSArray         *array;
@property (nonatomic, readonly) NSString        *filePath;
@property (nonatomic, readonly) NSString        *fileName;
@property (nonatomic, readonly) NSString        *fileFolder;
@property (nonatomic, readonly) NSUInteger      count;

@property (nonatomic, readonly, getter=isCached)    BOOL cached;

- (void)addModel:(id)model;
- (void)removeModel:(id)model;

- (void)insertModel:(id)model atIndex:(NSUInteger)index;
- (void)removeModelAtIndex:(NSUInteger)index;

- (void)moveModelFromIndex:(NSUInteger)index1 toIndex:(NSUInteger)index2;

- (NSUInteger)indexOfModel:(id)model;
- (id)modelAtIndex:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)idx;

- (void)performLoading;

@end
