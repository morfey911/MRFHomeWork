//
//  MRFQueue.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 03.08.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFQueue.h"

@interface MRFQueue ()
@property (nonatomic, retain) NSMutableArray *queue;

@end

@implementation MRFQueue

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.queue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.queue = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (BOOL)isEmpty {
    return ([self count] == 0);
}

#pragma mark -
#pragma mark Public Methods

- (void)enqueueObject:(id)object {
    [self.queue addObject:object];
}

- (id)dequeueObject {
    NSMutableArray *queue = self.queue;
    id object = queue[0];
    [queue removeObjectAtIndex:0];
    
    return object;
}

- (NSUInteger)count {
    return [self.queue count];
}

@end
