//
//  MRFStatisticViewController.m
//  Final Project
//
//  Created by Yurii Mamurko on 07.12.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFStatisticViewController.h"
#import "MRFStatisticView.h"
#import "MRFStaticticCell.h"
#import "MRFStatisticModel.h"

#import "MRFFillingFetchedArrayModel.h"
#import "MRFFilling.h"

#import "MRFConstants.h"
#import "MRFMacros.h"

#import "UITableView+MRFExtensions.h"
#import "NSString+MRFExtensions.h"

MRFViewControllerBaseViewProperty(MRFStatisticViewController, statisticView, MRFStatisticView)

@interface MRFStatisticViewController ()
@property (nonatomic, strong) MRFStatisticModel *last30DaysStatistic;
@property (nonatomic, strong) MRFStatisticModel *allTimeStatistic;

@end

@implementation MRFStatisticViewController

#pragma mark -
#pragma mark Initializations and Deallocation

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSDate *now = [NSDate date];
        NSDate *monthAgo = [self monthAgoDate];
        self.title = kMRFStatisticTitle;
        
        self.last30DaysStatistic = [[MRFStatisticModel alloc] initFromDate:monthAgo toDate:now];
        self.allTimeStatistic = [MRFStatisticModel new];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setLast30DaysStatistic:(MRFStatisticModel *)last30DaysStatistic {
    MRFSynthesizeObservingSetterAndLoad(last30DaysStatistic);
}

- (void)setAllTimeStatistic:(MRFStatisticModel *)allTimeStatistic {
    MRFSynthesizeObservingSetterAndLoad(allTimeStatistic);
}

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.last30DaysStatistic load];
}

#pragma mark -
#pragma mark Private

- (NSDate *)monthAgoDate {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *offsetComponent = [NSDateComponents new];
    offsetComponent.month = -1;
    
    return [calendar dateByAddingComponents:offsetComponent toDate:[NSDate date] options:0];
}

- (NSDictionary *)cellInfoWithStatisticModel:(MRFStatisticModel *)model forRow:(MRFRowTitles)row {
    switch (row) {
        case MRFDistanceRow:
            return @{@"distance" : model.distance};
            
        case MRFAveragePriceRow:
            return @{@"average price:" : model.averagePrice};
            
        case MRFAverageFuelConsumptionRow:
            return @{@"average fuel consumption:" : model.averageFuelConsumption};
            
        case MRFTotalSpentRow:
            return @{@"total spent:" : model.totalSpent};
            
        default:
            return nil;
    }
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return MRFStatisticCount;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case MRFLast30DaysStatistic:
            return kMRFLast30DaysSectionName;
        case MRFAllTimeStatistic:
            return kMRFAllTimeSectionName;
            
        default:
            return nil;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return MRFRowsCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MRFStaticticCell *cell = [tableView dequeueReusableCellWithClass:[MRFStaticticCell class]];
    
    NSDictionary *cellInfo = nil;
    
    if (MRFLast30DaysStatistic == indexPath.section) {
        cellInfo = [self cellInfoWithStatisticModel:self.last30DaysStatistic forRow:indexPath.row];
    } else {
        cellInfo = [self cellInfoWithStatisticModel:self.allTimeStatistic forRow:indexPath.row];
    }
    
    cell.titleLabel.text = [[cellInfo allKeys] firstObject];
    cell.valueLabel.text = [[[cellInfo allValues] firstObject] stringValue];
    
    return cell;
}

#pragma mark -
#pragma mark MRFModel

- (void)modelDidLoad:(id)model {
    if (MRFModelDidLoad == self.last30DaysStatistic.state && MRFModelDidLoad == self.allTimeStatistic.state) {
        [self.statisticView.tableView reloadData];
    }
}

- (void)model:(id)model didChangeWithObject:(id)object {
    if (model == self.arrayModel) {
        [self.statisticView.graphView reloadGraph];
        
        [self.allTimeStatistic reload];
        [self.last30DaysStatistic reload];
    }
}

#pragma mark -
#pragma mark BEMSimpleLineGraphDataSource

- (NSInteger)numberOfPointsInLineGraph:(BEMSimpleLineGraphView *)graph {
    return self.arrayModel.count;
}

- (CGFloat)lineGraph:(BEMSimpleLineGraphView *)graph valueForPointAtIndex:(NSInteger)index {
    NSUInteger count = self.arrayModel.count - index - 1;
    return [[self.arrayModel[count] price] doubleValue];
}

- (nullable NSString *)lineGraph:(nonnull BEMSimpleLineGraphView *)graph labelOnXAxisForIndex:(NSInteger)index {
    NSUInteger count = self.arrayModel.count - index - 1;
    return [NSString stringFromDate:[self.arrayModel[count] date] withFormat:@"dd/MM"];
}

@end
