//
//  MRFEmployeesPool.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 05.08.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFEmployeesPool.h"

#import "NSObject+MRFObjectExtensions.h"

@interface MRFEmployeesPool ()
@property (nonatomic, retain) NSMutableSet *mutableEmployees;

@end

@implementation MRFEmployeesPool

@dynamic employees;

#pragma mark -
#pragma mark Class methods

+ (MRFEmployeesPool *)pool {
    return [self object];
}

#pragma mark -
#pragma mark Allocations and Deallocations

- (void)dealloc {
    self.mutableEmployees = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.mutableEmployees = [NSMutableSet set];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSSet *)employees {
    @synchronized(_mutableEmployees) {
        return [[_mutableEmployees copy] autorelease];
    }
}

#pragma mark -
#pragma mark Public methods

- (void)addEmployee:(MRFEmployee *)employee {
    @synchronized (_mutableEmployees) {
        [_mutableEmployees addObject:employee];
    }
}

- (void)removeEmployee:(MRFEmployee *)employee {
    @synchronized (_mutableEmployees) {
        [_mutableEmployees removeObject:employee];
    }
}

- (id)freeEmployee {
    __block MRFEmployee *freeEmployee = nil;
    
    @synchronized (_mutableEmployees) {
        [_mutableEmployees enumerateObjectsUsingBlock:^(MRFEmployee *employee, BOOL *stop) {
            if (kMRFEmployeeDidBecomeFree == employee.state) {
                freeEmployee = employee;
                *stop = YES;
            }
        }];
    }
    
    return freeEmployee;
}

- (id)freeEmployeeWithClass:(Class)class {
    __block MRFEmployee *freeEmployee = nil;

    @synchronized (_mutableEmployees) {
        [_mutableEmployees enumerateObjectsUsingBlock:^(MRFEmployee *employee, BOOL *stop) {
            if ([employee isMemberOfClass:class] && kMRFEmployeeDidBecomeFree == employee.state) {
                freeEmployee = employee;
                *stop = YES;
            }
        }];
    }
    
    return freeEmployee;
}

- (NSSet *)freeEmployeesWithClass:(Class)class {
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(MRFEmployee *employee, NSDictionary *bindings) {
        return ([employee isMemberOfClass:class]
                && employee.state == kMRFEmployeeDidBecomeFree);
    }];
    
    return [self.employees filteredSetUsingPredicate:predicate];
}

- (BOOL)containsEmployee:(MRFEmployee *)employee {
    @synchronized (_mutableEmployees) {
        return [self.mutableEmployees containsObject:employee];
    }
}

- (NSUInteger)count {
    @synchronized (_mutableEmployees) {
        return [self.mutableEmployees count];
    }
}

@end
