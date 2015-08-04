//
//  MRFEmployee.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 13.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFEmployee.h"

@implementation MRFEmployee

@synthesize money = _money;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    
    [super dealloc];
}

- (instancetype)init {
    return [self initWithMoney:0 salary:0 experience:0];
}

- (instancetype)initWithMoney:(uint8_t)money salary:(uint8_t)salary experience:(uint8_t)experience {
    self = [super init];
    
    if (self) {
        self.money = money;
        self.salary = salary;
        self.experience = experience;
        self.free = YES;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors


#pragma mark -
#pragma mark Public Methods

- (void)performWorkWithObject:(id<MRFMoneyFlow>)object {
    [self doesNotRecognizeSelector:_cmd];
}

#pragma mark -
#pragma mark MRFMoneyFlow protocol

- (void)takeMoney:(uint8_t)money fromMoneyKeeper:(id <MRFMoneyFlow>)moneyKeeper {
    self.money += money;
    moneyKeeper.money -= money;
}

- (void)giveMoney:(uint8_t)money toMoneyKeeper:(id <MRFMoneyFlow>)moneyKeeper {
    self.money -= money;
    moneyKeeper.money += money;
}

@end
