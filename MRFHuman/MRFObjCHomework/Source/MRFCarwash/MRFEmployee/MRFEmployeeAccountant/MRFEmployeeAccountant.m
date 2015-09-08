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

- (void)workWithObject:(MRFEmployeeWasher *)washer {
    [self takeMoney:washer.money fromMoneyKeeper:washer];
    [self count];
}

#pragma mark -
#pragma mark Private

- (void)count {
    usleep(arc4random_uniform(10 * 1000));
}

@end
