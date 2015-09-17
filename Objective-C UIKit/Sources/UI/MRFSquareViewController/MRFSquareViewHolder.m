//
//  MRFSquareViewHolder.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 08.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFSquareViewHolder.h"
#import "MRFMacros.h"

static const NSTimeInterval kMRFSquareViewAnimationDuration = 0.5;
static const NSTimeInterval kMRFSquareViewAnimationDelay    = 0;
static NSString * const kMRFAnimateButtonNotMovedTitle      = @"Start";
static NSString * const kMRFAnimateButtonMovedTitle         = @"Stop";

@interface MRFSquareViewHolder ()
@property (nonatomic, assign)   BOOL    animationInProgress;

- (MRFSquarePositionType)nextPositionForSquare;
- (void)changeTitleForAnimateButton;
- (CGRect)frameForSquarePosition:(MRFSquarePositionType)squarePosition;

@end

@implementation MRFSquareViewHolder

#pragma mark -
#pragma mark Accessors

- (void)setAnimating:(BOOL)animating {
    if (_animating != animating) {
        _animating = animating;
        
        [self animateSquare];
    }
}

- (void)setAnimationInProgress:(BOOL)animationInProgress {
    if (_animationInProgress != animationInProgress) {
        _animationInProgress = animationInProgress;
    }
    
    [self changeTitleForAnimateButton];
}

- (void)setSquarePosition:(MRFSquarePositionType)position {
    [self setSquarePosition:position animated:NO];
}

- (void)setSquarePosition:(MRFSquarePositionType)position animated:(BOOL)animated {
    [self setSquarePosition:position animated:animated completionHandler:nil];
}

- (void)setSquarePosition:(MRFSquarePositionType)position
                 animated:(BOOL)animated
        completionHandler:(void(^)(BOOL finished))handler
{
    NSTimeInterval duration = animated ? kMRFSquareViewAnimationDuration : 0;
    
    [UIView animateWithDuration:duration
                          delay:kMRFSquareViewAnimationDelay
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.squareView.frame = [self frameForSquarePosition:position];
                     }
                     completion:^(BOOL finished) {
                         _squarePosition = position;
                         
                         if (handler) {
                             handler(finished);
                         }
                     }];
}

#pragma mark -
#pragma mark Private

- (MRFSquarePositionType)nextPositionForSquare {
    return arc4random_uniform(MRFSquarePositionCount);
}

- (void)animateSquare {
    if (self.animating && !self.animationInProgress) {
        MRFSquarePositionType position = [self nextPositionForSquare];
        self.animationInProgress = YES;
        MRFWeakify(self);
        
        [self setSquarePosition:position animated:YES completionHandler:^(BOOL finished){
            MRFStrongifyAndReturnIfNil(self);
            if (finished) {
                self.animationInProgress = NO;
                [self animateSquare];
            }
        }];
    }
}

- (void)changeTitleForAnimateButton {
    NSString *title = self.animating ? kMRFAnimateButtonMovedTitle : kMRFAnimateButtonNotMovedTitle;
    
    [self.animateButton setTitle:title forState:UIControlStateNormal];
}

- (CGRect)frameForSquarePosition:(MRFSquarePositionType)squarePosition {
    CGRect result = self.squareView.frame;
    CGRect superviewBounds = self.superview.bounds;
    CGPoint point = CGPointZero;
    CGPoint max = CGPointMake(CGRectGetWidth(superviewBounds) - CGRectGetWidth(result),
                              CGRectGetHeight(superviewBounds) - CGRectGetHeight(result));
    
    switch (squarePosition) {
        case MRFTopRightSquareCorner:
            point.x = max.x;
            break;
            
        case MRFBottomLeftSquareCorner:
            point.y = max.y;
            break;
            
        case MRFBottomRightSquareCorner:
            point = max;
            break;
            
        default:
            break;
    }
    
    result.origin = point;
    
    return result;
}

@end
