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

#import "IDPCoreDataManager.h"

#import "MRFMacros.h"

MRFViewControllerBaseViewProperty(MRFFillingDetailViewController, detailView, MRFFillingDetailView)

@implementation MRFFillingDetailViewController

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.detailView.model = [self lastFillingFromDB];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Private

- (MRFFilling *)lastFillingFromDB {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass([MRFFilling class])];
    request.sortDescriptors = @[[[NSSortDescriptor alloc] initWithKey:@"date" ascending:YES]];
    NSManagedObjectContext *context = [[IDPCoreDataManager sharedManager] managedObjectContext];
    
    return [[context executeFetchRequest:request error:nil] firstObject];
}

@end
