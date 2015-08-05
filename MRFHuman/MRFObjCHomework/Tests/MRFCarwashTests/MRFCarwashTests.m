//
//  MRFWashcarTests.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 05.08.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFCarwashTests.h"

#import "MRFCar.h"
#import "MRFCarwashEnterprise.h"
#import "NSObject+MRFObjectExtensions.h"

@interface MRFCarwashTests ()

+ (void)MRFCarwashOneCarTest;
+ (void)MRFCarwashMultipleCarsTest;

@end

@implementation MRFCarwashTests

+ (void)MRFCarwashBehaviourTests {
//    [self MRFCarwashOneCarTest];
    [self MRFCarwashMultipleCarsTest];
}

+ (void)MRFCarwashOneCarTest {
    //afters car and carwash was created
    MRFCar *car = [[[MRFCar alloc] initWithMoney:250] autorelease];
    MRFCarwashEnterprise *carwash = [MRFCarwashEnterprise object];
    
    //car must be dirty and have money
    assert(NO == car.clean);
    assert(250 == car.money);
    
    [carwash hireStaff];
    [carwash takeTheCar:car];
    
    assert(YES == car.clean);
    assert(150 == car.money);
}

+ (void)MRFCarwashMultipleCarsTest {
    NSMutableArray *cars = [NSMutableArray array];
    MRFCarwashEnterprise *carwash = [MRFCarwashEnterprise object];
    
    for (NSUInteger index = 0; index < 50; index++) {
        MRFCar *car = [[[MRFCar alloc] initWithMoney:100] autorelease];
        [cars addObject:car];
    }
    
    [carwash hireStaff];
    [carwash takeTheCars:cars];
}

@end
