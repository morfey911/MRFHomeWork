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

- (void)notifyOfStateChangeWithSelector:(SEL)selector;

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

- (void)setState:(NSUInteger)state {
    if (_state != state) {
        _state = state;
        
        [self notifyOfStateChangeWithSelector:[self selectorForState:state]];
    }
}

- (NSSet *)observersSet {
    return self.observersHashTable.setRepresentation;
}

#pragma mark -
#pragma mark Public Methods

- (void)addObserver:(id)observer {
    [self.observersHashTable addObject:observer];
}

- (void)removeObserver:(id)observer {
    [self.observersHashTable removeObject:observer];
}

- (void)removeObservers {
    [self.observersHashTable removeAllObjects];
}

- (BOOL)containsObserver:(id)observer {
    return [self.observersHashTable containsObject:observer];
}

#pragma mark -
#pragma mark Private Methods

- (SEL)selectorForState:(NSUInteger)state {
    [self doesNotRecognizeSelector:_cmd];
    
    return nil;
}

- (void)notifyOfStateChangeWithSelector:(SEL)selector {
    NSHashTable *observers = self.observersHashTable;
    for (id observer in observers) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector withObject:self];
        }
    }
}

@end
