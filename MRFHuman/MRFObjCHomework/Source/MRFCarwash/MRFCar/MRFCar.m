//
//  MRFCar.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 13.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFCar.h"

@implementation MRFCar

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

@end
