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
#import "MRFInfoModel.h"
#import "MRFLoadingView.h"

#import "MRFMacros.h"

#import "UITableView+MRFExtensions.h"
#import "NSIndexPath+MRFExtension.h"

MRFViewControllerBaseViewProperty(MRFInfoViewController, infoView, MRFInfoView)

@interface MRFInfoViewController ()
@property (nonatomic, strong)   MRFLoadingView  *loadingView;

@end

@implementation MRFInfoViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.arrayModel = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setArrayModel:(MRFArrayModel *)arrayModel {
    MRFSynthesizeObservingSetterAndLoad(arrayModel)
}

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
    return self.arrayModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MRFInfoCell *cell = [tableView dequeueReusableCellWithClass:[MRFInfoCell class]];
    
    cell.info = self.arrayModel[indexPath.row];
    
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL result = indexPath.row == self.arrayModel.count - 1;
    
    return result ? UITableViewCellEditingStyleInsert : UITableViewCellEditingStyleDelete;
}

- (void)    tableView:(UITableView *)tableView
   commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    MRFArrayModel *arrayModel = self.arrayModel;
    
    if (UITableViewCellEditingStyleDelete == editingStyle) {
        [arrayModel removeModelAtIndex:indexPath.row];
    } else if (UITableViewCellEditingStyleInsert == editingStyle) {
        [arrayModel addModel:[MRFInfoModel new]];
    }
}

- (void)    tableView:(UITableView *)tableView
   moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
          toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [self.arrayModel moveModelFromIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}

#pragma mark -
#pragma mark MRFArrayModelProtocol

- (void)modelWillLoad:(MRFArrayModel *)model {
    self.loadingView = [MRFLoadingView loadingViewWithSuperview:self.view];
    self.loadingView.visible = YES;
}

- (void)modelDidLoad:(MRFArrayModel *)model {
    [self.infoView.tableView reloadData];
    self.loadingView.visible = NO;
}

- (void)model:(MRFArrayModel *)model didChangeWithObject:(MRFArrayChangesModel *)object {
    [self.infoView.tableView updateWithChanges:object];
}

@end
