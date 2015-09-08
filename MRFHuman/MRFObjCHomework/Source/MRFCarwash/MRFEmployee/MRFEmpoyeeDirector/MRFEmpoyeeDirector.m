//
//  MRFEmpoyeeDirector.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 04.08.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFEmpoyeeDirector.h"

#import "MRFEmployeeAccountant.h"

@interface MRFEmpoyeeDirector ()
- (void)profit;

@end

@implementation MRFEmpoyeeDirector

#pragma mark -
#pragma mark Public

- (void)workWithObject:(MRFEmployeeAccountant *)accountant {
    [self takeMoney:accountant.money fromMoneyKeeper:accountant];
    [self profit];
}

- (void)performWorkWithObjectOnMainThread:(MRFEmployee *)object {
    [object employeeMayBeFree];
    
    [self employeeMayBeFree];
}

#pragma mark -
#pragma mark Private

- (void)profit {
    usleep(arc4random_uniform(10 * 1000));
    
    NSLog(@"Directors money = %d", self.money);
}

@end
