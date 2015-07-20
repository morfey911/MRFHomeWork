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

#pragma mark -
#pragma mark Public Methods

- (void)takeMoney:(uint8_t)money fromMoneyKeeper:(id <MRFMoneyFlow>)moneyKeeper {
    self.money += money;
    moneyKeeper.money -= money;
}

- (void)giveMoney:(uint8_t)money toMoneyKeeper:(id <MRFMoneyFlow>)moneyKeeper {
    self.money -= money;
    moneyKeeper.money += money;
}

@end
