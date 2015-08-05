//
//  MRFEmployee.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 13.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MRFMoneyFlow.h"
#import "MRFObservableObject.h"
#import "MRFEmployeeObserver.h"

typedef NS_ENUM(NSUInteger, MRFEmployeeState) {
    kMRFEmployeeDidBecomeFree,
    kMRFEmployeeDidBecomeBusy,
    kMRFEmployeeDidPerformWorkWithObject
};

@interface MRFEmployee : MRFObservableObject <MRFMoneyFlow, MRFEmployeeObserver>
@property (nonatomic, assign)                   uint8_t           salary;
@property (nonatomic, assign)                   uint8_t           experience;
@property (nonatomic, assign, readonly)         MRFEmployeeState  state;
@property (nonatomic, assign, getter=isFree)    BOOL              free;

- (instancetype)initWithMoney:(uint8_t)money salary:(uint8_t)salary experience:(uint8_t)experience;

- (void)performWorkWithObject:(id<MRFMoneyFlow>)object;

- (SEL)selectorForState:(MRFEmployeeState)state;

@end
