//
//  MRFInfoViewController.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 17.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFInfoViewController.h"
#import "MRFInfoView.h"
#import "MRFMacros.h"

MRFViewControllerBaseViewProperty(MRFInfoViewController, infoView, MRFInfoView)

@interface MRFInfoViewController ()

@end

@implementation MRFInfoViewController

#pragma mark -
#pragma mark Accessors


#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onAddButton:(id)sender {
    
}

- (IBAction)onRemoveButton:(id)sender {
    
}

- (IBAction)onResortButton:(id)sender {
    
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return nil;
}

@end
