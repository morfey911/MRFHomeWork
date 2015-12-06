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
#import "MRFFetchedArrayModel.h"

#import "IDPCoreDataManager.h"
#import "MRFMacros.h"

#import "NSManagedObject+IDPExtensions.h"
#import "UITableView+MRFExtensions.h"

static NSString * const kMRFTitle = @"Fuel";
static NSString * const kMRFFillingDetailStoryboardName = @"MRFFillingDetailViewController";

MRFViewControllerBaseViewProperty(MRFMainViewController, mainView, MRFMainView)

@interface MRFMainViewController ()
@property (nonatomic, strong)   MRFFetchedArrayModel    *arrayModel;

- (MRFFetchedArrayModel *)fetchedArrayModelWithRequest;

@end

@implementation MRFMainViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.arrayModel = nil;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = kMRFTitle;
        self.arrayModel = [self fetchedArrayModelWithRequest];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setArrayModel:(MRFFetchedArrayModel *)arrayModel {
    MRFSynthesizeObservingSetterAndLoad(arrayModel);
}

#pragma mark -
#pragma mark Private

- (MRFFetchedArrayModel *)fetchedArrayModelWithRequest {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass([MRFFilling class])];
    request.sortDescriptors = @[[[NSSortDescriptor alloc] initWithKey:@"date" ascending:NO]];
    
    return [[MRFFetchedArrayModel alloc] initWithFetchRequest:request];
}


#pragma mark -
#pragma mark UITableViewDataSource

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (0 == section) {
        return kMRFTitle;
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
