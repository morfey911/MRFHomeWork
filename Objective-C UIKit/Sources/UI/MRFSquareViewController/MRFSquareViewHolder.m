//
//  MRFSquareViewHolder.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 08.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFSquareViewHolder.h"
#import "UIColor+MRFExtentions.h"

static const NSTimeInterval MRFSquareViewAnimationDuration = 0.6;
static const NSTimeInterval MRFSquareViewAnimationDelay = 0;
static NSString *MRFAnimateButtonNotMovedTitle = @"Start";
static NSString *MRFAnimateButtonMovedTitle = @"Stop";

@interface MRFSquareViewHolder ()

- (void)changeTitleForAnimateButton;
- (CGRect)frameForSquarePosition:(MRFSquarePositionType)squarePosition;

@end

@implementation MRFSquareViewHolder

#pragma mark -
#pragma mark Accessors

- (void)setMoving:(BOOL)moving {
    if (_moving != moving) {
        [self changeTitleForAnimateButton];
        _moving = moving;
    }
}

- (void)setSquarePosition:(MRFSquarePositionType)position {
    [self setSquarePosition:position animated:YES];
}

- (void)setSquarePosition:(MRFSquarePositionType)position animated:(BOOL)animated {
    [self setSquarePosition:position animated:animated completionHandler:nil];
}

- (void)setSquarePosition:(MRFSquarePositionType)position
                 animated:(BOOL)animated
        completionHandler:(void(^)(void))handler
{
    UIView *squareView = self.squareView;
    NSTimeInterval duration = animated ? MRFSquareViewAnimationDuration : 0;
    
    [UIView animateWithDuration:duration
                          delay:MRFSquareViewAnimationDelay
                        options:0
                     animations:^{
                         squareView.frame = [self frameForSquarePosition:position];
                         squareView.backgroundColor = [UIColor randomColor];
                     }
                     completion:^(BOOL finished) {
                         _squarePosition = position;
                         
                         if (handler) {
                             handler();
                         }
                     }];
}

#pragma mark -
#pragma mark Private

- (void)changeTitleForAnimateButton {
    UIButton *animateButton = self.animateButton;
    
    self.moving ?
    [animateButton setTitle:MRFAnimateButtonNotMovedTitle forState:UIControlStateNormal] :
    [animateButton setTitle:MRFAnimateButtonMovedTitle forState:UIControlStateNormal];
}

- (CGRect)frameForSquarePosition:(MRFSquarePositionType)squarePosition {
    CGRect result = self.squareView.frame;
    CGRect superviewBounds = self.superview.bounds;
    CGPoint point = CGPointZero;
    
    CGPoint max = CGPointZero;
    max.x = CGRectGetWidth(superviewBounds) - CGRectGetWidth(result);
    max.y = CGRectGetHeight(superviewBounds) - CGRectGetHeight(result);
    
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
