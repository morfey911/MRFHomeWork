//
//  MRFEmployeesPool.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 05.08.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MRFEmployee.h"

@interface MRFEmployeesPool : NSObject
@property (nonatomic, retain, readonly) NSSet *employees;

+ (MRFEmployeesPool *)pool;

- (void)addEmployee:(MRFEmployee *)employee;

- (void)removeEmployee:(MRFEmployee *)employee;

- (id)freeEmployeeWithClass:(Class)class;

- (NSSet *)freeEmployeesWithClass:(Class)class;

- (BOOL)containsEmployee:(MRFEmployee *)employee;

- (NSUInteger)count;

@end
