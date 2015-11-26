//
//  MRFFillingDetailViewController.m
//  Final Project
//
//  Created by Yurii Mamurko on 21.11.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFFillingDetailViewController.h"

#import "MRFFillingDetailView.h"

#import "MRFFilling.h"

#import "ActiveRecordKit.h"

#import "MRFMacros.h"

MRFViewControllerBaseViewProperty(MRFFillingDetailViewController, detailView, MRFFillingDetailView)

@interface MRFFillingDetailViewController ()

- (MRFFilling *)lastFillingModelFromDB;

@end

@implementation MRFFillingDetailViewController

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.detailView.model = [self lastFillingModelFromDB];
    [self setupNavigationBar];
}

#pragma mark -
#pragma mark Interface Handling

- (void)onSaveButton {
    MRFFilling *filling = [MRFFilling managedObject];
    MRFFillingDetailView *view = self.detailView;
    
    filling.mileage = [NSNumber numberWithFloat:[view.mileageField.text floatValue]];
    filling.volume = [NSNumber numberWithFloat:[view.volumeField.text floatValue]];
    filling.price = [NSNumber numberWithFloat:[view.priceField.text floatValue]];
    filling.date = view.date;
    
    [filling saveManagedObject];
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark Private

- (void)setupNavigationBar {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                                          target:self
                                                                          action:@selector(onSaveButton)];
    [self.navigationItem setRightBarButtonItem:item];
}

- (MRFFilling *)lastFillingModelFromDB {
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:NO];
    
    return [[NSManagedObjectContext fetchEntity:NSStringFromClass([MRFFilling class])
                           withSortDescriptors:@[sortDescriptor]
                                     predicate:nil
                                  prefetchPaths:nil] firstObject];
}

@end
