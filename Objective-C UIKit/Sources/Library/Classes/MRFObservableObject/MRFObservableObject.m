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

- (void)performBlock:(void(^)(void))block shouldNotify:(BOOL)shouldNotify;

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
        self.shouldNotify = YES;
        self.observersHashTable = [NSHashTable weakObjectsHashTable];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setState:(NSUInteger)state {
    [self setState:state withObject:nil];
}

- (void)setState:(NSUInteger)state withObject:(id)object {
    @synchronized(self) {
        if (_state != state) {
            _state = state;
        }
        
        if (self.shouldNotify) {
            [self notifyObserversWithObject:object];
        }
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

- (void)notifyObservers {
    [self notifyObserversWithObject:nil];
}

- (void)notifyObserversWithObject:(id)object {
    [self notifyObserversWithSelector:[self selectorForState:self.state] withObject:object];
}

- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object {
    for (id observer in self.observersHashTable) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector withObject:self withObject:object];
        }
    }
}

- (void)performBlockWithNotification:(void(^)(void))block {
    [self performBlock:block shouldNotify:YES];
}

- (void)performBlockWithoutNotification:(void(^)(void))block {
    [self performBlock:block shouldNotify:NO];
}

#pragma mark -
#pragma mark Private

- (void)performBlock:(void(^)(void))block shouldNotify:(BOOL)shouldNotify {
    @synchronized(self) {
        BOOL notificationState = self.shouldNotify;
        self.shouldNotify = shouldNotify;
        
        if (block) {
            block();
        }
        
        self.shouldNotify = notificationState;
    }
}

@end
