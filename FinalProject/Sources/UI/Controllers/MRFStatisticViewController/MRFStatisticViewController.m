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

#import "MRFConstants.h"

#import "MRFMacros.h"

#import "UITableView+MRFExtensions.h"

MRFViewControllerBaseViewProperty(MRFStatisticViewController, statisticView, MRFStatisticView)

@implementation MRFStatisticViewController

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark -
#pragma mark Private

#pragma mark -
#pragma mark UITableViewDelegate

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
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MRFStaticticCell *cell = [tableView dequeueReusableCellWithClass:[MRFStaticticCell class]];
    
    return cell;
}

@end
