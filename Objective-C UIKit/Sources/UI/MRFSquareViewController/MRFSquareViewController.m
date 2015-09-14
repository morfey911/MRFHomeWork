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
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onTapAnimateButton:(id)sender {
    self.squareView.moving = !self.squareView.moving;
    
    [self moveSquareToRandomPosition];
}

#pragma mark -
#pragma mark Private

- (void)moveSquareToRandomPosition {
    if (self.squareView.moving) {
        MRFSquarePositionType position = (arc4random_uniform(MRFSquarePositionCount));
        [self.squareView setSquarePosition:position animated:YES completionHandler:^{
            [self moveSquareToRandomPosition];
        }];
    }
}

@end
