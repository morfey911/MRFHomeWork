//
//  MRFEmployeesPool.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 05.08.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFEmployeesPool.h"

@interface MRFEmployeesPool ()
@property (nonatomic, retain) NSMutableSet *mutableEmployees;

@end

@implementation MRFEmployeesPool

@dynamic employees;

#pragma mark -
#pragma mark Class methods

+ (MRFEmployeesPool *)pool {
    return [[[self alloc] init] autorelease];
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
    [self.mutableEmployees addObject:employee];
}

- (void)removeEmployee:(MRFEmployee *)employee {
    [self.mutableEmployees removeObject:employee];
}

- (id)freeEmployeeWithClass:(Class)class {
    __block MRFEmployee *freeEmployee = nil;
    
    [self.mutableEmployees enumerateObjectsUsingBlock:^(MRFEmployee *employee, BOOL *stop) {
        
        if ([employee isMemberOfClass:class] && employee.free == YES) {
            freeEmployee = employee;
            *stop = YES;
        }
    }];
    
    return freeEmployee;
}

- (BOOL)containsEmployee:(MRFEmployee *)employee {
    return [self.mutableEmployees containsObject:employee];
}

- (NSUInteger)count {
    return [self.mutableEmployees count];
}

@end
