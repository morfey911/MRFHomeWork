//
//  MRFObservableObject.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 04.08.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFObservableObject.h"

@interface MRFObservableObject ()
@property (nonatomic, retain) NSHashTable *observersHashTable;

@end

@implementation MRFObservableObject

@dynamic observersSet;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.observersHashTable = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.observersHashTable = [NSHashTable weakObjectsHashTable];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSSet *)observersSet {
    @synchronized (self) {
        return self.observersHashTable.setRepresentation;
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)addObserver:(id)observer {
    @synchronized (self) {
        [self.observersHashTable addObject:observer];
    }
}

- (void)removeObserver:(id)observer {
    @synchronized (self) {
        [self.observersHashTable removeObject:observer];
    }
}

- (void)removeObservers {
    @synchronized (self) {
        [self.observersHashTable removeAllObjects];
    }
}

- (BOOL)containsObserver:(id)observer {
    @synchronized (self) {
        return [self.observersHashTable containsObject:observer];
    }
}

- (void)notifyObserversWithSelector:(NSString *)selector {
    @synchronized (self) {
        [self notifyObserversWithSelector:selector withObject:self];
    }
}

- (void)notifyObserversWithSelector:(NSString *)selector withObject:(id)object {
    @synchronized (self) {
        SEL trueSelector = NSSelectorFromString(selector);
        for (id observer in self.observersHashTable) {
            if ([observer respondsToSelector:trueSelector]) {
                [observer performSelector:trueSelector withObject:object];
            }
        }
    }
}

@end
