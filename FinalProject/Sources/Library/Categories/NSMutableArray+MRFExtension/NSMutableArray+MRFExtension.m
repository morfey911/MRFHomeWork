//
//  NSMutableArray+MRFExtension.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 22.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "NSMutableArray+MRFExtension.h"

@implementation NSMutableArray (MRFExtension)

- (void)moveObjectFromIndex:(NSUInteger)index1 toIndex:(NSUInteger)index2 {
    id object = [self objectAtIndex:index1];
    
    [self removeObjectAtIndex:index1];
    [self insertObject:object atIndex:index2];
}

@end
