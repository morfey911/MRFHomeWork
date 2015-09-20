//
//  MRFArrayModel.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 18.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFArrayModel.h"

@interface MRFArrayModel ()
@property (nonatomic, strong)   NSMutableArray  *mutableArray;

@end

@implementation MRFArrayModel

#pragma mark -
#pragma mark Public

- (void)addModel:(MRFInfoModel *)model {
    [self.mutableArray addObject:model];
}

- (void)removeModel:(MRFInfoModel *)model {
    [self.mutableArray removeObject:model];
}

- (void)addModel:(MRFInfoModel *)model atIndex:(NSUInteger)index {
    [self.mutableArray insertObject:model atIndex:index];
}

- (void)removeModelAtIndex:(NSUInteger)index {
    [self.mutableArray removeObjectAtIndex:index];
}

- (MRFInfoModel *)modelAtIndex:(NSUInteger)index {
    return [self.mutableArray objectAtIndex:index];
}

- (MRFInfoModel *)objectAtIndexedSubscript:(NSUInteger)idx {
    return [self modelAtIndex:idx];
}

- (NSUInteger)count {
    return [self.mutableArray count];
}

@end
