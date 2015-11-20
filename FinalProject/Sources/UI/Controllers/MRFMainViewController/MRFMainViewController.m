//
//  MRFMainViewController.m
//  Final Project
//
//  Created by Yurii Mamurko on 09.11.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFMainViewController.h"
#import "MRFFillingDetailVewController.h"

#import "MRFMainView.h"
#import "MRFFillingCell.h"

#import "MRFFilling.h"
#import "MRFFetchedArrayModel.h"

#import "IDPCoreDataManager.h"
#import "MRFMacros.h"

#import "NSManagedObject+IDPExtensions.h"
#import "UITableView+MRFExtensions.h"

MRFViewControllerBaseViewProperty(MRFMainViewController, mainView, MRFMainView)

@interface MRFMainViewController ()
@property (nonatomic, strong)   MRFFetchedArrayModel    *arrayModel;

- (void)setupNavigationBar;

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
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationBar];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onStatisticButton:(id)sender {
    
}

- (void)onAddButton {
    MRFFillingDetailVewController *controller = [[MRFFillingDetailVewController alloc] init];

    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark -
#pragma mark Private

- (void)setupNavigationBar {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onAddButton)];
    [self.navigationItem setRightBarButtonItem:item];
}

- (MRFFetchedArrayModel *)fetchedArrayModelWithRequest {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass([MRFFilling class])];
    request.sortDescriptors = @[[[NSSortDescriptor alloc] initWithKey:@"date" ascending:YES]];
    
    return [[MRFFetchedArrayModel alloc] initWithFetchRequest:request];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MRFFillingCell *cell = [tableView dequeueReusableCellWithClass:[MRFFillingCell class]];
    
    cell.fillingModel = self.arrayModel[indexPath.row];
    
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark -
#pragma mark MRFModel

- (void)modelDidLoad:(MRFFetchedArrayModel *)model {
    [self.mainView.tableView reloadData];
}

@end
