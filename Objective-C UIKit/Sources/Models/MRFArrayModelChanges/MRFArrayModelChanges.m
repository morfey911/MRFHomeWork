//
//  MRFArrayModelChanges.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 24.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFArrayModelChanges.h"

#import "NSIndexPath+MRFExtension.h"

@interface MRFArrayModelChanges ()
@property (nonatomic, strong)   NSMutableArray  *mutableArray;

@end

@implementation MRFArrayModelChanges

@dynamic array;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableArray = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)array {
    return [self.mutableArray copy];
}

#pragma mark -
#pragma mark Public

- (void)addRow:(NSUInteger)row {
    [self.mutableArray addObject:[NSIndexPath indexPathForRow:row]];
}

- (void)addIndexPath:(NSIndexPath *)path {
    [self.mutableArray addObject:path];
}

@end
