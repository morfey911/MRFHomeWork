//
//  MRFCarwashEnterprise.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 15.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFCarwashEnterprise.h"

#import "NSObject+MRFObjectExtensions.h"

#import "MRFEmployeeWasher.h"
#import "MRFCar.h"
#import "MRFEmployeesPool.h"
#import "MRFEmployeeAccountant.h"
#import "MRFEmpoyeeDirector.h"
#import "MRFQueue.h"

@interface MRFCarwashEnterprise ()
@property (nonatomic, retain) MRFQueue *cars;
@property (nonatomic, retain) MRFEmployeesPool *employees;

- (void)hireBosses;
- (void)hireWashers;

@end

@implementation MRFCarwashEnterprise

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.cars = nil;
    self.employees = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.cars = [MRFQueue queue];
        self.employees = [MRFEmployeesPool pool];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)hireStaff {
    [self hireBosses];
    [self hireWashers];
}

- (void)takeTheCars:(NSArray *)cars {
    MRFEmployeeWasher *washer = nil;
    MRFQueue *carsQueue = self.cars;
    
    for (MRFCar *car in cars) {
        [carsQueue enqueueObject:car];
    }
    
    while (!carsQueue.isEmpty && (washer = [self.employees freeEmployeeWithClass:[MRFEmployeeWasher class]])) {
        @synchronized (washer) {
            @synchronized (carsQueue) {
                if (carsQueue.isEmpty) {
                    break;
                }
                
                [washer performWorkWithObjectInBackground:[carsQueue dequeueObject]];
            }
        }
    }
    
    [[NSRunLoop currentRunLoop] run];
}

#pragma mark -
#pragma mark Private Methods

- (void)hireBosses {
    MRFEmpoyeeDirector *director = [MRFEmpoyeeDirector object];
    MRFEmployeeAccountant *accountant = [MRFEmployeeAccountant object];
    
    [self.employees addEmployee:director];
    [self.employees addEmployee:accountant];
    
    [accountant addObserver:director];
}

- (void)hireWashers {
    MRFEmployeesPool *employees = self.employees;
    MRFEmployeeAccountant *accountant = [employees freeEmployeeWithClass:[MRFEmployeeAccountant class]];
    NSUInteger washersCount = arc4random_uniform(3) + 1;
    
    for (NSUInteger index = 0; index < washersCount; index++) {
        MRFEmployeeWasher *washer = [[MRFEmployeeWasher alloc] initWithPrice:100];
        
        [washer addObserver:self];
        [washer addObserver:accountant];
        [employees addEmployee:washer];
    }
    
    NSLog (@"Hired %lu washers", washersCount);
}

#pragma mark -
#pragma mark <MRFEmployeeObserver>

- (void)MRFEmployeeDidBecomeFree:(MRFEmployeeWasher *)washer {
    @synchronized (washer) {
        NSLog(@"Washer %@ just became free", washer);
        MRFQueue *carsQueue = self.cars;
        
        if (!carsQueue.isEmpty) {
            [washer performWorkWithObjectInBackground:[carsQueue dequeueObject]];
        }
    }
}

@end
