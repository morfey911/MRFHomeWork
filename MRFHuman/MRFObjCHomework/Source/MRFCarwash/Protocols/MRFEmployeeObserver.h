//
//  MRFEmployeeObserver.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 04.08.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MRFMoneyFlow.h"

@class MRFEmployee;

@protocol MRFEmployeeObserver <NSObject>

@optional
- (void)MRFEmployeeDidBecomeFree:(MRFEmployee *)employee;
- (void)MRFEmployeeDidBecomeBusy:(MRFEmployee *)employee;
- (void)MRFEmployeeDidPerformWorkWithObject:(id<MRFMoneyFlow>)object;

@end