//
//  MRFMainViewController.m
//  Final Project
//
//  Created by Yurii Mamurko on 09.11.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFMainViewController.h"
#import "MRFFillingDetailViewController.h"

#import "MRFMainView.h"
#import "MRFFillingCell.h"

#import "MRFFilling.h"
#import "MRFFillingFetchedArrayModel.h"

#import "IDPCoreDataManager.h"
#import "MRFConstants.h"
#import "MRFMacros.h"

#import "NSManagedObject+IDPExtensions.h"
#import "UITableView+MRFExtensions.h"

MRFViewControllerBaseViewProperty(MRFMainViewController, mainView, MRFMainView)

@implementation MRFMainViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = kMRFFuelTitle;
    }
    
    return self;
}

#pragma mark -
#pragma mark UITableViewDataSource

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (0 == section) {
        return kMRFFuelTitle;
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MRFFillingCell *cell = [tableView dequeueReusableCellWithClass:[MRFFillingCell class]];
    
    cell.fillingModel = self.arrayModel[indexPath.row];
    
    return cell;
}

- (void)    tableView:(UITableView *)tableView
   commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (UITableViewCellEditingStyleDelete == editingStyle) {
        MRFFilling *filling = [self.arrayModel modelAtIndex:indexPath.row];
        
        [filling deleteManagedObject];
    }
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:kMRFFillingDetailStoryboardName bundle:nil];
    MRFFillingDetailViewController *controller = [sb instantiateInitialViewController];
    controller.filling = self.arrayModel[indexPath.row];
    
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark -
#pragma mark MRFModel

- (void)modelDidLoad:(MRFFetchedArrayModel *)model {
    [self.mainView.tableView reloadData];
}

- (void)model:(MRFFetchedArrayModel *)model didChangeWithObject:(MRFArrayChangesModel *)object {
    [self.mainView.tableView updateWithChanges:object];
}

@end
