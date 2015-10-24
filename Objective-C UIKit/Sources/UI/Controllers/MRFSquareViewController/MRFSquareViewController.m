//
//  MRFSquareViewController.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 08.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFSquareViewController.h"
#import "MRFSquareViewHolder.h"
#import "MRFMacros.h"

MRFViewControllerBaseViewProperty(MRFSquareViewController, squareView, MRFSquareViewHolder)

@implementation MRFSquareViewController

#pragma mark -
#pragma mark Public

- (IBAction)onAnimateButton:(id)sender {
    MRFSquareViewHolder *squareView = self.squareView;
    squareView.animating = !squareView.animating;
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
