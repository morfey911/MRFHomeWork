//
//  MRFMoneyKeeper.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 02.08.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFMoneyKeeper.h"

@implementation MRFMoneyKeeper

#pragma mark -
#pragma mark Allocations and Deallocations

- (void)dealloc {
    
    [super dealloc];
}

- (instancetype)init {
    return [self initWithMoney:0];
}

- (instancetype)initWithMoney:(uint32_t)money {
    self = [super init];
    
    if (self) {
        self.money = money;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)takeMoney:(uint32_t)money fromMoneyKeeper:(MRFMoneyKeeper *)moneyKeeper {
    self.money += money;
    moneyKeeper.money -= money;
}

- (void)giveMoney:(uint32_t)money toMoneyKeeper:(MRFMoneyKeeper *)moneyKeeper {
    self.money -= money;
    moneyKeeper.money += money;
}

@end
