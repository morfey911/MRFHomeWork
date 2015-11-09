//
//  MRFFriendDetailViewController.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 29.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFFriendDetailViewController.h"

#import "MRFFriendDetailView.h"

#import "MRFMacros.h"

MRFViewControllerBaseViewProperty(MRFFriendDetailViewController, friendDetailView, MRFFriendDetailView)

@interface MRFFriendDetailViewController ()

@end

@implementation MRFFriendDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.friendDetailView.model = self.model;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
