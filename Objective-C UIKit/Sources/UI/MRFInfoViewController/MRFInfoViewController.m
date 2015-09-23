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
#import "NSIndexPath+MRFExtension.h"

MRFViewControllerBaseViewProperty(MRFInfoViewController, infoView, MRFInfoView)

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

- (IBAction)onEditButton:(id)sender {
    MRFInfoView *view = self.infoView;
    
    view.editing = !view.editing;
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arrayModel count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MRFInfoCell *cell = [tableView dequeueReusableCellWithClass:[MRFInfoCell class]];
    
    cell.info = self.arrayModel[indexPath.row];
    
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL result = indexPath.row == [self.arrayModel count] - 1;
    
    return result ? UITableViewCellEditingStyleInsert : UITableViewCellEditingStyleDelete;
}

- (void)    tableView:(UITableView *)tableView
   commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    MRFArrayModel *arrayModel = self.arrayModel;
    NSArray *array = @[indexPath];
    
    if (UITableViewCellEditingStyleDelete == editingStyle) {
        [arrayModel removeModelAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationAutomatic];
    } else if (UITableViewCellEditingStyleInsert == editingStyle) {
        NSIndexPath *lastRowIndexPath = [NSIndexPath indexPathForRow:[arrayModel count]];
        
        [arrayModel addModel:[MRFInfoModel new]];
        [tableView insertRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationAutomatic];
        [tableView reloadRowsAtIndexPaths:@[lastRowIndexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    }
}

- (void)    tableView:(UITableView *)tableView
   moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
          toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [self.arrayModel moveModelFromIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}

@end
