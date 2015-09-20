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
#import "MRFArrayModel.h"
#import "MRFMacros.h"
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
    
    return [self.arrayModel count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MRFInfoCell *cell = [tableView dequeueReusableCellWithClass:[MRFInfoCell class]];
    
    cell.info = [self.arrayModel modelAtIndex:indexPath.length];
    
    return cell;
}

@end
