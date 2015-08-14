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
#pragma mark Class methods

+ (instancetype)queue {
    return [[[self alloc] init] autorelease];
}

+ (instancetype)queueWithSet:(NSSet *)set {
    return [[[self alloc] initWithSet:set] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.queue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    return [self initWithSet:nil];
}

- (instancetype)initWithSet:(NSSet *)set {
    self = [super init];
    
    if (self) {
        self.queue = [NSMutableArray array];
        
        for (id object in set) {
            [self.queue addObject:object];
        }
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
    @synchronized(_queue) {
        [_queue addObject:object];
    }
}

- (id)dequeueObject {
    @synchronized (_queue) {
        id object = [[[_queue firstObject] retain] autorelease];
        if (object) {
            [_queue removeObjectAtIndex:0];
        }
        
        return object;
    }
}

- (NSUInteger)count {
    @synchronized(_queue) {
        return [_queue count];
    }
}

@end
