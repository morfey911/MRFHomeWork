//
//  MRFEmployee.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 13.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MRFMoneyFlow.h"

typedef NS_ENUM(NSUInteger, MRFEmployeeState) {
    MRFEmployeeDidBecomeFree,
    MRFEmployeeDidBecomeBusy,
    MRFEmployeeDidPerformWorkWithObject
};

@interface MRFEmployee : NSObject <MRFMoneyFlow>
@property (nonatomic, assign)           uint8_t salary;
@property (nonatomic, assign)           uint8_t experience;
@property (nonatomic, getter=isFree)    BOOL    free;

- (void)performWorkWithObject:(id<MRFMoneyFlow>)object;

@end
