//
//  MRFSquareViewController.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 08.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFSquareViewController.h"

#import "MRFSquareViewHolder.h"

@interface MRFSquareViewController ()
@property (nonatomic, readonly) MRFSquareViewHolder  *squareView;

@end

@implementation MRFSquareViewController

@dynamic squareView;

#pragma mark -
#pragma mark Accessors

- (MRFSquareViewHolder *)squareView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[MRFSquareViewHolder class]]) {
        return (MRFSquareViewHolder *)self.view;
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
