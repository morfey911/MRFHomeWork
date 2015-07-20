//
//  MRFCarwashEnterprise.h
//  MRFHuman
//
//  Created by Yurii Mamurko on 15.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MRFBuilding;
@class MRFEmployeeWasher;

@interface MRFCarwashEnterprise : NSObject
@property (nonatomic, retain, readonly) MRFBuilding *carwashBuilding;
@property (nonatomic, retain, readonly) MRFBuilding *administrativeBuilding;
@property (nonatomic, copy, readonly) NSMutableSet *washers;

- (void)preparation;

- (void)work;

@end
