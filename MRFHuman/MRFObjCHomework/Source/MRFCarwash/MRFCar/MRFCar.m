//
//  MRFCar.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 13.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFCar.h"

@implementation MRFCar

@synthesize money = _money;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    return [self initWithMoney:0];
}

- (instancetype)initWithMoney:(uint8_t)money {
    self = [super init];
    
    if (self) {
        self.money = money;
    }
    
    return self;
}

#pragma mark -
#pragma mark MRFMoneyFlow Protocol

- (void)takeMoney:(uint8_t)money fromMoneyKeeper:(id <MRFMoneyFlow>)moneyKeeper {
    self.money += money;
    moneyKeeper.money -= money;
}

- (void)giveMoney:(uint8_t)money toMoneyKeeper:(id <MRFMoneyFlow>)moneyKeeper {
    self.money -= money;
    moneyKeeper.money += money;
}

@end
