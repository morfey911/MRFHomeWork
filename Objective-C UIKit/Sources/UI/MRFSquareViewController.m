//
//  MRFSquareViewController.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 08.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFSquareViewController.h"

#import "MRFHolderForSquareView.h"

@interface MRFSquareViewController ()
@property (nonatomic, readonly) MRFHolderForSquareView   *squareView;

@end

@implementation MRFSquareViewController

@dynamic squareView;

#pragma mark -
#pragma mark Accessors

- (MRFHolderForSquareView *)squareView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[MRFHolderForSquareView class]]) {
        return (MRFHolderForSquareView *)self.view;
    }
    
    return nil;
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
