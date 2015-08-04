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
@property (nonatomic, assign) uint8_t capital;

- (void)profit;

@end

@implementation MRFEmpoyeeDirector

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

- (void)performWorkWithObject:(MRFEmployeeAccountant *)accountant {
    self.free = NO;
    [self takeMoney:accountant.capital fromMoneyKeeper:accountant];
    accountant.free = YES;
    [self profit];
    self.free = YES;
}

#pragma mark -
#pragma mark Private

- (void)profit {
    self.capital += self.money;
    self.money = 0;
}

@end
