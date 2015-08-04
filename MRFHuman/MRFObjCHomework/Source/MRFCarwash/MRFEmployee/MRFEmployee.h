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

@interface MRFEmployee : MRFObservableObject <MRFMoneyFlow>
@property (nonatomic, assign)                   uint8_t           salary;
@property (nonatomic, assign)                   uint8_t           experience;
@property (nonatomic, assign, readonly)         MRFEmployeeState  state;
@property (nonatomic, assign, getter=isFree)    BOOL              free;

- (void)performWorkWithObject:(id<MRFMoneyFlow>)object;

- (SEL)selectorForState:(MRFEmployeeState)state;

@end
