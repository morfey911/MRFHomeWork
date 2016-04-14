//
//  MRFStatisticModel.h
//  Final Project
//
//  Created by Yurii Mamurko on 10.12.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFModel.h"

@interface MRFStatisticModel : MRFModel
@property (nonatomic, readonly) NSNumber        *distance;
@property (nonatomic, readonly) NSNumber        *averagePrice;
@property (nonatomic, readonly) NSNumber        *totalSpent;
@property (nonatomic, readonly) NSNumber        *averageFuelConsumption;

- (instancetype)initFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;

- (void)reload;

@end
