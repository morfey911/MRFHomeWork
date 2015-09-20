//
//  MRFInfoViewController.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 17.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFInfoViewController.h"
#import "MRFInfoView.h"
#import "MRFInfoCell.h"
#import "MRFMacros.h"
#import "UINib+MRFExtentions.h"
#import "UITableView+MRFExtentions.h"

MRFViewControllerBaseViewProperty(MRFInfoViewController, infoView, MRFInfoView)

@interface MRFInfoViewController ()

@end

@implementation MRFInfoViewController

#pragma mark -
#pragma mark Accessors


#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.infoView.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onAddButton:(id)sender {
    
}

- (IBAction)onRemoveButton:(id)sender {
    
}

- (IBAction)onResortButton:(id)sender {
    
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Class cellClass = [MRFInfoCell class];
    MRFInfoCell *cell = [tableView dequeueReusableCellWithClass:cellClass];
    
    if (!cell) {
        cell = [UINib objectWithClass:cellClass];
    }
    
    cell.info = self.infoModel;
    
    return cell;
}

@end
