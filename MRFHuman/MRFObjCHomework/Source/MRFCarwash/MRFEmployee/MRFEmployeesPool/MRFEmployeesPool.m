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
    return [[self.mutableEmployees copy] autorelease];
}

#pragma mark -
#pragma mark Public methods

- (void)addEmployee:(MRFEmployee *)employee {
    @synchronized (_mutableEmployees) {
        [self.mutableEmployees addObject:employee];
    }
}

- (void)removeEmployee:(MRFEmployee *)employee {
    @synchronized (_mutableEmployees) {
        [self.mutableEmployees removeObject:employee];
    }
}

- (id)freeEmployeeWithClass:(Class)class {
    @synchronized (_mutableEmployees) {
        __block MRFEmployee *freeEmployee = nil;
        
        [self.mutableEmployees enumerateObjectsUsingBlock:^(MRFEmployee *employee, BOOL *stop) {
            
            if ([employee isMemberOfClass:class] && employee.state == kMRFEmployeeDidBecomeFree) {
                freeEmployee = employee;
                *stop = YES;
            }
        }];
        
        return freeEmployee;
    }
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
