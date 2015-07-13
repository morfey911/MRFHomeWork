//
//  MRFCar.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 13.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFCar.h"

@interface MRFCar ()
@property (nonatomic, assign) uint8_t money;

@end

@implementation MRFCar

#pragma mark -
#pragma mark Accessors

- (instancetype)init {
    return [[super init] initWithMoney:0 andClear:NO];
}

- (instancetype)initWithMoney:(uint8_t)money andClear:(BOOL)isClear {
    self = [super init];
    
    if (self) {
        self.money = money;
        self.isClear = isClear;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (uint8_t)giveMoney:(uint8_t)money {
    if (money <= self.money) {
        self.money -= money;
        
        return self.money;
    }
    
    return 0;
}

@end
