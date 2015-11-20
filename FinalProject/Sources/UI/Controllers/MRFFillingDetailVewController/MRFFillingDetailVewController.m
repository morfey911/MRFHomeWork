//
//  MRFFillingDetailVewController.m
//  Final Project
//
//  Created by Yurii Mamurko on 17.11.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFFillingDetailVewController.h"

#import "MRFFillingDetailCell.h"

#import "UITableView+MRFExtensions.h"

static const NSUInteger sectionCount = 5;

@implementation MRFFillingDetailVewController

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return sectionCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MRFFillingDetailCell *cell = [tableView dequeueReusableCellWithClass:[MRFFillingDetailCell class]];
    
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate



@end
