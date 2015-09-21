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

- (void)addModel:(MRFInfoModel *)model;
- (void)removeModel:(MRFInfoModel *)model;

- (void)addModel:(MRFInfoModel *)model atIndex:(NSUInteger)index;
- (void)removeModelAtIndex:(NSUInteger)index;

- (void)exchangeModelAtIndex:(NSUInteger)idx1 withModelAtIndex:(NSUInteger)idx2;

- (MRFInfoModel *)modelAtIndex:(NSUInteger)index;
- (MRFInfoModel *)objectAtIndexedSubscript:(NSUInteger)idx;

- (NSUInteger)count;

@end
