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

static NSString * const kMRFNavigationItemTitle = @"Add fuel";

MRFViewControllerBaseViewProperty(MRFFillingDetailViewController, detailView, MRFFillingDetailView)

@interface MRFFillingDetailViewController ()

- (MRFFilling *)lastFillingModelFromDB;

@end

@implementation MRFFillingDetailViewController

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.filling) {
        self.detailView.model = self.filling;
    } else {
        self.detailView.placeholdersModel = [self lastFillingModelFromDB];
    }
    
    [self setupNavigationBar];
}

#pragma mark -
#pragma mark Interface Handling

- (void)onSaveButton:(UIBarButtonItem *)sender {
    MRFFillingDetailView *view = self.detailView;
    MRFFilling *filling = nil;
    
    filling = self.filling ? self.filling : [MRFFilling managedObject];
    
    filling.mileage = [NSDecimalNumber decimalNumberWithString:view.mileageField.text];
    filling.volume = [NSDecimalNumber decimalNumberWithString:view.volumeField.text];
    filling.price = [NSDecimalNumber decimalNumberWithString:view.priceField.text
                                                      locale:[NSLocale currentLocale]];
    
    filling.date = view.date;
    
    [filling saveManagedObject];
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark Private

- (void)setupNavigationBar {
    UINavigationItem *navigationItem = self.navigationItem;
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                                          target:self
                                                                          action:@selector(onSaveButton:)];
    
    navigationItem.title = kMRFNavigationItemTitle;
    [navigationItem setRightBarButtonItem:buttonItem];
}

- (MRFFilling *)lastFillingModelFromDB {
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:NO];
    
    return [[NSManagedObjectContext fetchEntity:NSStringFromClass([MRFFilling class])
                           withSortDescriptors:@[sortDescriptor]
                                     predicate:nil
                                  prefetchPaths:nil] firstObject];
}

@end
