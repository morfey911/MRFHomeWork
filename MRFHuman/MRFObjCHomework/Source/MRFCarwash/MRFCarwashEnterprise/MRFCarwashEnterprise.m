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
#import "MRFDispatcher.h"

@interface MRFCarwashEnterprise ()
@property (nonatomic, retain) MRFQueue *cars;
@property (nonatomic, retain) MRFEmployeesPool *employees;
@property (nonatomic, retain) MRFDispatcher *washerDispatcher;
@property (nonatomic, retain) MRFDispatcher *accountantDispatcher;
@property (nonatomic, retain) MRFDispatcher *directorDispatcher;

- (void)hireDirectors;
- (void)hireAccountants;
- (void)hireWashers;

@end

@implementation MRFCarwashEnterprise

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.cars = nil;
    self.employees = nil;
    self.washerDispatcher = nil;
    self.accountantDispatcher = nil;
    self.directorDispatcher = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.cars = [MRFQueue queue];
        self.employees = [MRFEmployeesPool pool];
        self.washerDispatcher = [MRFDispatcher object];
        self.accountantDispatcher = [MRFDispatcher object];
        self.directorDispatcher = [MRFDispatcher object];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)takeTheCars:(NSArray *)cars {
    [self hireStaff];
    
    MRFDispatcher *washerDispatcher = self.washerDispatcher;
    
    for (MRFCar *car in cars) {
        [washerDispatcher performSelectorInBackground:@selector(addProcessingObject:) withObject:car];
    }
    
    [[NSRunLoop currentRunLoop] run];
}

#pragma mark -
#pragma mark Private Methods

- (void)hireStaff {
    [self hireDirectors];
    [self hireAccountants];
    [self hireWashers];
}

- (void)hireDirectors {
    [self.directorDispatcher addHandler:[MRFEmpoyeeDirector object]];
    
    NSLog(@"Hired 1 director");
}

- (void)hireAccountants {
    MRFDispatcher *accountantDispatcher = self.accountantDispatcher;
    NSUInteger accountantsCount = arc4random_uniform(24) + 1;
    accountantsCount = 20;
    
    for (NSUInteger index = 0; index < accountantsCount; index++) {
        MRFEmployeeAccountant *accountant = [MRFEmployeeAccountant object];
        
        [accountant addObserver:self];
        [accountantDispatcher addHandler:accountant];
    }
    
    NSLog(@"Hired %lu accountants", accountantsCount);
}

- (void)hireWashers {
    MRFDispatcher *washerDispatcher = self.washerDispatcher;
    NSUInteger washersCount = arc4random_uniform(49) + 1;
    washersCount = 50;
    
    for (NSUInteger index = 0; index < washersCount; index++) {
        MRFEmployeeWasher *washer = [[MRFEmployeeWasher alloc] initWithPrice:100];
        
        [washer addObserver:self];
        [washerDispatcher addHandler:washer];
    }
    
    NSLog (@"Hired %lu washers", washersCount);
}

#pragma mark -
#pragma mark <MRFEmployeeObserver>

- (void)MRFEmployeeDidPerformWorkWithObject:(id<MRFMoneyFlow>)object {
    if ([object isKindOfClass:[MRFEmployeeWasher class]]) {
        [self.accountantDispatcher addProcessingObject:object];
    } else if ([object isKindOfClass:[MRFEmployeeAccountant class]]) {
        [self.directorDispatcher addProcessingObject:object];
    }
}

@end
