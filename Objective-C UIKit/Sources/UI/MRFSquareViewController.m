//
//  MRFSquareViewController.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 08.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFSquareViewController.h"

#import "MRFSquareView.h"

@interface MRFSquareViewController ()
@property (nonatomic, readonly) MRFSquareView   *squareView;

@end

@implementation MRFSquareViewController

@dynamic squareView;

#pragma mark -
#pragma mark Accessors

- (MRFSquareView *)squareView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[MRFSquareView class]]) {
        return (MRFSquareView *)self.view;
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

- (IBAction)startButtonClick:(id)sender {
    MRFSquareView *view = self.squareView;
    view.squarePosition = (view.squarePosition + 1) % 4;
}

@end
