//
//  MRFObservableObject.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 04.08.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MRFObservableObject : NSObject
@property (nonatomic, assign) NSUInteger state;
@property (nonatomic, retain, readonly) NSSet *observersSet;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;
- (void)removeObservers;
- (BOOL)containsObserver:(id)observer;

// This method only for subclassing. Never call it directly;
- (SEL)selectorForState:(NSUInteger)state;

@end
