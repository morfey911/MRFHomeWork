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
@property (nonatomic, assign) uint8_t capital;

- (void)count;

@end

@implementation MRFEmployeeAccountant

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    return [self initWithCapital:0];
}

- (instancetype)initWithCapital:(uint8_t)capital {
    self = [super init];
    
    if (self) {
        self.capital = capital;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)performWorkWithObject:(MRFEmployeeWasher *)washer {
    [self takeMoney:washer.money fromMoneyKeeper:washer];
    washer.free = YES;
    [self count];
    [self notifyObserversWithSelector:[self selectorForState:kMRFEmployeeDidPerformWorkWithObject]];
}

#pragma mark -
#pragma mark Private

- (void)count {
    self.capital += self.money;
    self.money = 0;
}

@end
