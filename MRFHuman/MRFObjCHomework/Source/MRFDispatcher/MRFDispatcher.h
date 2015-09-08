//
//  MRFDispatcher.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 17.08.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MRFEmployeeObserver.h"

@class MRFEmployee;

@interface MRFDispatcher : NSObject <MRFEmployeeObserver>

- (void)addProcessingObject:(id)object;

- (void)addHandler:(MRFEmployee *)handler;
- (void)removeHandler:(MRFEmployee *)handler;

@end
