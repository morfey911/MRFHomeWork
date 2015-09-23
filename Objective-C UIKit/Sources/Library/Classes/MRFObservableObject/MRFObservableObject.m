//
//  MRFObservableObject.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 04.08.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFObservableObject.h"

#import "MRFDispatch.h"

@interface MRFObservableObject ()
@property (nonatomic, retain) NSHashTable *observersHashTable;

@end

@implementation MRFObservableObject

@synthesize state = _state;

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

- (void)setState:(NSUInteger)state {
    @synchronized(self) {
        _state = state;
        
        [self notifyObserversOnMainThreadWithSelector:[self selectorForState:state]];
    }
}

- (NSUInteger)state {
    @synchronized(self) {
        return _state;
    }
}

- (NSSet *)observersSet {
    @synchronized(self) {
        return self.observersHashTable.setRepresentation;
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)addObserver:(id)observer {
    @synchronized(self) {
        [self.observersHashTable addObject:observer];
    }
}

- (void)removeObserver:(id)observer {
    @synchronized(self) {
        [self.observersHashTable removeObject:observer];
    }
}

- (void)removeObservers {
    @synchronized(self) {
        [self.observersHashTable removeAllObjects];
    }
}

- (BOOL)containsObserver:(id)observer {
    @synchronized(self) {
        return [self.observersHashTable containsObject:observer];
    }
}

- (SEL)selectorForState:(NSUInteger)state {
    return nil;
}

- (void)notifyObserversOnMainThreadWithSelector:(SEL)selector {
    MRFDispatchSyncOnMainThread(^{
        [self notifyObserversWithSelector:selector];
    });
}

- (void)notifyObserversWithSelector:(SEL)selector {
    [self notifyObserversWithSelector:selector withObject:self];
}

- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object {
    for (id observer in self.observersHashTable) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector withObject:object];
        }
    }
}

@end
