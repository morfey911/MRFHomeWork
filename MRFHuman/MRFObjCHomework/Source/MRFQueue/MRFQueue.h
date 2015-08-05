//
//  MRFQueue.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 03.08.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MRFQueue : NSObject
@property (nonatomic, assign, readonly, getter=isEmpty) BOOL empty;

+ (instancetype)queue;

- (void)enqueueObject:(id)object;

- (id)dequeueObject;

- (NSUInteger)count;

@end
