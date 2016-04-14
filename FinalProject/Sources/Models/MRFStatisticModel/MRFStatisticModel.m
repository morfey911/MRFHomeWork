//
//  MRFStatisticModel.m
//  Final Project
//
//  Created by Yurii Mamurko on 10.12.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFStatisticModel.h"

#import "MRFArrayModel.h"

#import "MRFFilling.h"

#import "MRFConstants.h"

#import "MRFDispatch.h"

#import "ActiveRecordKit.h"

@interface MRFStatisticModel ()
@property (nonatomic, strong)   NSPredicate     *datePredicate;
@property (nonatomic, strong)   NSNumber        *distance;
@property (nonatomic, strong)   NSNumber        *averagePrice;
@property (nonatomic, strong)   NSNumber        *totalSpent;
@property (nonatomic, strong)   NSNumber        *averageFuelConsumption;

@end

@implementation MRFStatisticModel

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate {
    self = [super init];
    if (self) {
        self.datePredicate = [NSPredicate predicateWithFormat:@"date >= %@ && date <= %@", fromDate, toDate];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)reload {
    [self performLoading];
}

#pragma mark -
#pragma mark Private

- (NSNumber *)distanceFromSortedArray:(NSArray *)array {
    MRFFilling *oldestFilling = array.firstObject;
    MRFFilling *newestFilling = array.lastObject;
    
    return @([newestFilling.mileage integerValue] - [oldestFilling.mileage integerValue]);
}

- (NSNumber *)averagePriceFromArray:(NSArray *)array {
    float price = 0;
    
    for (MRFFilling *filling in array) {
        price += [filling.price floatValue];
    }
    
    return @(price / array.count);
}

- (NSNumber *)totalSpentFromArray:(NSArray *)array {
    float totalSpent = 0;
    
    for (MRFFilling *filling in array) {
        totalSpent += [filling.price floatValue] * [filling.volume floatValue];
    }
    
    return @(totalSpent);
}

- (NSNumber *)averageFuelConsumptionFromArray:(NSArray *)array {
    float fuelVolume = 0;
    
    for (MRFFilling *filling in array) {
        fuelVolume += [filling.volume floatValue];
    }
    
    return @(fuelVolume / [self.distance floatValue] * 100);
}

#pragma mark -
#pragma mark MRFModel

- (void)performLoading {
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"mileage" ascending:YES];
    NSArray *array = [NSManagedObjectContext fetchEntity:NSStringFromClass([MRFFilling class])
                                     withSortDescriptors:@[sortDescriptor]
                                               predicate:self.datePredicate
                                           prefetchPaths:nil];
    
    self.distance = [self distanceFromSortedArray:array];
    self.averagePrice = [self averagePriceFromArray:array];
    self.totalSpent = [self totalSpentFromArray:array];
    self.averageFuelConsumption = [self averageFuelConsumptionFromArray:array];
    
    MRFDispatchAsyncOnMainThread(^{
        self.state = MRFModelDidLoad;
    });
}

@end
