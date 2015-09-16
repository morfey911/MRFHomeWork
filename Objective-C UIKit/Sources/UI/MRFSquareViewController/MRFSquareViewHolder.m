//
//  MRFSquareViewHolder.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 08.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFSquareViewHolder.h"
#import "MRFMacros.h"

static const NSTimeInterval kMRFSquareViewAnimationDuration = 0.4;
static const NSTimeInterval kMRFSquareViewAnimationDelay = 0;
static NSString *kMRFAnimateButtonNotMovedTitle = @"Start";
static NSString *kMRFAnimateButtonMovedTitle = @"Stop";

@interface MRFSquareViewHolder ()

- (void)changeTitleForAnimateButton;
- (CGRect)frameForSquarePosition:(MRFSquarePositionType)squarePosition;

@end

@implementation MRFSquareViewHolder

#pragma mark -
#pragma mark Accessors

- (void)setSquarePosition:(MRFSquarePositionType)position {
    [self setSquarePosition:position animated:NO];
}

- (void)setSquarePosition:(MRFSquarePositionType)position animated:(BOOL)animated {
    [self setSquarePosition:position animated:animated completionHandler:nil];
}

- (void)setSquarePosition:(MRFSquarePositionType)position
                 animated:(BOOL)animated
        completionHandler:(void(^)(void))handler
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
                             handler();
                         }
                     }];
}

#pragma mark -
#pragma mark Public

- (void)moveSquareToRandomPosition {
    [self changeTitleForAnimateButton];
    
    if (self.moving) {
        MRFSquarePositionType position = (arc4random_uniform(MRFSquarePositionCount));
        MRFWeakify(self);
        
        [self setSquarePosition:position animated:YES completionHandler:^{
            MRFStrongify(self);
            [self moveSquareToRandomPosition];
        }];
    }
}

#pragma mark -
#pragma mark Private

- (void)changeTitleForAnimateButton {
    NSString *title = self.moving ? kMRFAnimateButtonMovedTitle : kMRFAnimateButtonNotMovedTitle;
    
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
