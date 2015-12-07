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

- (void)setupNavigationBar;

@end

@implementation MRFViewController

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationBar];
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

@end
