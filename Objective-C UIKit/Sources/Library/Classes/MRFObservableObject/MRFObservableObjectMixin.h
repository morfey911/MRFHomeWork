//
//  MRFObservableObjectMixin.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 04.11.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MRFObservableObjectMixin <NSObject>

@optional

@property (nonatomic, assign)           NSUInteger  state;
@property (nonatomic, readonly)         BOOL        shouldNotify;
@property (nonatomic, retain, readonly) NSSet       *observersSet;
@property (nonatomic, retain, readonly) id          target;

+ (id)observableObjectWithTarget:(id)target;

- (void)setState:(NSUInteger)state withObject:(id)object;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;
- (void)removeObservers;
- (BOOL)containsObserver:(id)observer;

- (SEL)selectorForState:(NSUInteger)state;

- (void)notifyObservers;
- (void)notifyObserversWithObject:(id)object;
- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object;

- (void)performBlockWithNotification:(void(^)(void))block;
- (void)performBlockWithoutNotification:(void(^)(void))block;

@end
