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
@property (nonatomic, assign) uint64_t capital;

- (void)profit;

@end

@implementation MRFEmpoyeeDirector

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    return [self initWithCapital:0];
}

- (instancetype)initWithCapital:(uint64_t)capital {
    self = [super init];
    
    if (self) {
        self.capital = capital;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)performWorkWithObject:(MRFEmployeeAccountant *)accountant {
    @synchronized (self) {
        self.free = NO;
        [self takeMoney:accountant.money fromMoneyKeeper:accountant];
        accountant.free = YES;
        [self profit];
        self.free = YES;
    }
}

#pragma mark -
#pragma mark Private

- (void)profit {
    self.capital += self.money;
    self.money = 0;
    
    NSLog(@"Directors capital = %llu", self.capital);
}

@end
