//
//  MRFStatisticViewController.h
//  Final Project
//
//  Created by Yurii Mamurko on 07.12.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFViewController.h"

#import "BEMSimpleLineGraphView.h"

typedef NS_ENUM(NSUInteger, MRFStatisticCategories) {
    MRFLast30DaysStatistic,
    MRFAllTimeStatistic,
    MRFStatisticCount
};

typedef NS_ENUM(NSUInteger, MRFRowTitles) {
    MRFDistanceRow,
    MRFAveragePriceRow,
    MRFTotalSpentRow,
    MRFAverageFuelConsumptionRow,
    MRFRowsCount
};

@interface MRFStatisticViewController : MRFViewController <BEMSimpleLineGraphDataSource,
                                                                BEMSimpleLineGraphDelegate>

@end
