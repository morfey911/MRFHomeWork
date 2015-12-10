//
//  MRFViewController.m
//  Final Project
//
//  Created by Yurii Mamurko on 09.11.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFViewController.h"

#import "MRFFillingDetailViewController.h"

#import "MRFFilling.h"

#import "MRFFetchedArrayModel.h"

#import "MRFConstants.h"

#import "MRFMacros.h"

@interface MRFViewController ()
@property (nonatomic, strong)   MRFFetchedArrayModel    *arrayModel;

- (void)setupNavigationBar;
- (MRFFetchedArrayModel *)fetchedArrayModelWithRequest;

@end

@implementation MRFViewController

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
    if (_arrayModel != arrayModel) {
        MRFSynthesizeObservingSetterAndLoad(arrayModel);
    }
}

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationBar];
    [self.arrayModel load];
}

#pragma mark -
#pragma mark Interface Handling

- (void)onAddButton:(UIBarButtonItem *)sender {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:kMRFFillingDetailStoryboardName bundle:nil];
    MRFFillingDetailViewController *controller = [sb instantiateInitialViewController];
    
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark -
#pragma mark Private

- (void)setupNavigationBar {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                          target:self
                                                                          action:@selector(onAddButton:)];
    [self.navigationItem setRightBarButtonItem:item];
}

- (MRFFetchedArrayModel *)fetchedArrayModelWithRequest {
    static MRFFetchedArrayModel *model = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass([MRFFilling class])];
        request.sortDescriptors = @[[[NSSortDescriptor alloc] initWithKey:kMRFDate ascending:NO]];
        model = [MRFFetchedArrayModel fetchedArrayModelWithFetchRequest:request];
    });
    
    return model;
}

#pragma mark -
#pragma mark MRFModel

- (void)modelDidLoad:(MRFFetchedArrayModel *)model {
    
}

- (void)model:(MRFFetchedArrayModel *)model didChangeWithObject:(id)object {
    
}

@end
