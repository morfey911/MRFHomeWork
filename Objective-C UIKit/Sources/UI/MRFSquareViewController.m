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
@property (nonatomic, readonly) MRFHolderForSquareView  *squareView;

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

- (IBAction)onClickStartButton:(id)sender {
    [self changeTitleForButton];
    
    self.squareView.moving = self.squareView.moving ? NO : YES;
    
    [self moveSquareToRandomPosition];
}

#pragma mark -
#pragma mark Private

- (void)changeTitleForButton {
    UIButton *startButton = self.squareView.startButton;
    
    self.squareView.moving ?
        [startButton setTitle:@"Start" forState:UIControlStateNormal] :
        [startButton setTitle:@"Stop" forState:UIControlStateNormal];
}

- (void)moveSquareToRandomPosition {
    MRFSquarePositionType position = (arc4random_uniform(MRFSquarePositionCount));
    
    if (self.squareView.moving) {
        [self.squareView setSquarePosition:position animated:YES completionHandler:^{
            [self moveSquareToRandomPosition];
        }];
    }
}

@end
