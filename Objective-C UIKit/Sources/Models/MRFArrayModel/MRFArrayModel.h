//
//  MRFArrayModel.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 18.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MRFInfoModel;

@interface MRFArrayModel : NSObject
@property (nonatomic, readonly) NSArray *array;

+ (instancetype)arrayWithModelsCount:(NSUInteger)count;

- (instancetype)initWithModelsCount:(NSUInteger)count;

- (void)addModel:(id)model;
- (void)removeModel:(id)model;

- (void)insertModel:(id)model atIndex:(NSUInteger)index;
- (void)removeModelAtIndex:(NSUInteger)index;

- (void)moveModelFromIndex:(NSUInteger)index1 toIndex:(NSUInteger)index2;

- (id)modelAtIndex:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)idx;

- (NSUInteger)count;

@end
