//
//  MRFHolderForSquareView.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 08.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFHolderForSquareView.h"

@interface MRFHolderForSquareView ()

- (void)moveSquare:(CGRect)frame;
- (CGRect)frameForSquarePosition:(MRFSquarePositionType)squarePosition;

@end

@implementation MRFHolderForSquareView

#pragma mark -
#pragma mark Public

- (void)setSquarePosition:(MRFSquarePositionType)position {
    [self setSquarePosition:position animated:NO];
}

- (void)setSquarePosition:(MRFSquarePositionType)position
                 animated:(BOOL)animated
{
    [self setSquarePosition:position animated:NO completionHandler:^{
        NSLog(@"test");
    }];
}

- (void)setSquarePosition:(MRFSquarePositionType)position
                 animated:(BOOL)animated
        completionHandler:(void(^)(void))handler
{
    [self moveSquare:[self frameForSquarePosition:position]];
    _squarePosition = position;
}


- (IBAction)onClickStartButton:(id)sender {
    self.squarePosition = (self.squarePosition + 1) % MRFSquarePositionCount;
}

#pragma mark -
#pragma mark Private

- (void)moveSquare:(CGRect)frame {
    self.squareView.frame = frame;
}

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
