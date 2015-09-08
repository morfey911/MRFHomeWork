//
//  MRFCarwashEnterprise.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 15.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MRFCar.h"
#import "MRFEmployeeObserver.h"

@interface MRFCarwashEnterprise : NSObject <MRFEmployeeObserver>

- (void)hireStaff;

- (void)takeTheCars:(NSArray *)cars;

@end
