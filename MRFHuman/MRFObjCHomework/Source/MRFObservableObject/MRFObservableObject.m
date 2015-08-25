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

- (void)notifyObserversOnMainThreadWithSelector:(NSString *)selector {
    if ([NSThread isMainThread]) {
        [self notifyObserversWithSelector:selector];
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self notifyObserversWithSelector:selector];
        });
    }
}

- (void)notifyObserversWithSelector:(NSString *)selector {
    [self notifyObserversWithSelector:selector withObject:self];
}

- (void)notifyObserversWithSelector:(NSString *)selector withObject:(id)object {
    SEL trueSelector = NSSelectorFromString(selector);
    for (id observer in self.observersHashTable) {
        if ([observer respondsToSelector:trueSelector]) {
            [observer performSelector:trueSelector withObject:object];
        }
    }
}

@end
