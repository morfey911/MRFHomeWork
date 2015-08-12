//
//  MRFEmployeeWasher.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 13.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFEmployeeWasher.h"

#import "MRFCar.h"

@interface MRFEmployeeWasher ()

- (void)washCar:(MRFCar *)car;

@end

@implementation MRFEmployeeWasher

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithPrice:(uint8_t)price {
    self = [super init];
    
    if (self) {
        self.price = price;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)performWorkWithObject:(MRFCar *)car {
    @synchronized (self) {
        NSLog(@"Washer just started wash a car: %@" ,car);
        [self takeMoney:self.price fromMoneyKeeper:car];
        [self washCar:car];
        
        [super performWorkWithObject:car];
    }
}

#pragma mark -
#pragma mark Private

- (void)washCar:(MRFCar *)car {
    usleep(arc4random_uniform(100 * 1000));
    car.clean = YES;
}

@end
