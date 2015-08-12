//
//  MRFEmployeeAccountant.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 04.08.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFEmployeeAccountant.h"

#import "MRFEmployeeWasher.h"

@interface MRFEmployeeAccountant ()

- (void)count;

@end

@implementation MRFEmployeeAccountant

#pragma mark -
#pragma mark Public

- (void)performWorkWithObject:(MRFEmployeeWasher *)washer {
    @synchronized (self) {
        NSLog(@"Accountant just started work with washer: %@", washer);
        [self employeeStartWork];
        [self takeMoney:washer.money fromMoneyKeeper:washer];
        [washer employeeMayBeFree];
        [self count];
        [self employeeFinishWork];
    }
}

#pragma mark -
#pragma mark Private

- (void)count {
    usleep(arc4random_uniform(10 * 1000));
}

@end
