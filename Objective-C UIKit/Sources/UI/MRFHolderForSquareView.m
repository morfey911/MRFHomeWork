//
//  MRFHolderForSquareView.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 08.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFHolderForSquareView.h"
#import "UIColor+MRFExtentions.h"

static const NSTimeInterval MRFSquareViewAnimationDuration = 0.6;
static const NSTimeInterval MRFSquareViewAnimationDelay = 0;

@interface MRFHolderForSquareView ()

- (CGRect)frameForSquarePosition:(MRFSquarePositionType)squarePosition;

@end

@implementation MRFHolderForSquareView

#pragma mark -
#pragma mark Accessors

- (void)setSquarePosition:(MRFSquarePositionType)position {
    [self setSquarePosition:position animated:YES];
}

- (void)setSquarePosition:(MRFSquarePositionType)position animated:(BOOL)animated {
    [self setSquarePosition:position animated:animated completionHandler:^{
    
    }];
}

- (void)setSquarePosition:(MRFSquarePositionType)position
                 animated:(BOOL)animated
        completionHandler:(void(^)(void))handler
{
    NSTimeInterval duration = animated ? MRFSquareViewAnimationDuration : 0;
    
    [UIView animateWithDuration:duration
                          delay:MRFSquareViewAnimationDelay
                        options:0
                     animations:^{
                         self.squareView.frame = [self frameForSquarePosition:position];
                         self.squareView.backgroundColor = [UIColor randomColor];
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

- (CGRect)frameForSquarePosition:(MRFSquarePositionType)squarePosition {
    CGRect result = self.squareView.frame;
    CGRect superviewBounds = self.superview.bounds;
    CGPoint point = CGPointZero;
    
    switch (squarePosition) {
        case MRFTopRightCorner:
            point.x = CGRectGetWidth(superviewBounds) - CGRectGetWidth(result);
            break;
            
        case MRFBottomLeftCorner:
            point.y = CGRectGetHeight(superviewBounds) - CGRectGetHeight(result);
            break;
            
        case MRFBottomRightCorner:
            point.x = CGRectGetWidth(superviewBounds) - CGRectGetWidth(result);
            point.y = CGRectGetHeight(superviewBounds) - CGRectGetHeight(result);
            break;
            
        default:
            break;
    }
    
    result.origin = point;
    
    return result;
}

@end
