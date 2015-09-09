//
//  MRFSquareView.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 08.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFSquareView.h"

@implementation MRFSquareView

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
    [self moveSquare:[self pointFromSquarePosition:position]];
    _squarePosition = position;
}

#pragma mark -
#pragma mark Private

- (void)moveSquare:(CGPoint)point {
    CGRect rect = {point, self.squareView.frame.size};
    self.squareView.frame = rect;
}

- (CGPoint)pointFromSquarePosition:(MRFSquarePositionType)squarePosition {
    CGPoint point;
    point.x = 0;
    point.y = 0;
    
    if (squarePosition == MRFTopLeftCorner) {
        return point;
    } else if (squarePosition == MRFTopRightCorner) {
        point.x = [[UIScreen mainScreen] bounds].size.width - 50;
        point.y = 0;
        return point;
    } else if (squarePosition == MRFBottomRightCorner) {
        point.x = [[UIScreen mainScreen] bounds].size.width - 50;
        point.y = [[UIScreen mainScreen] bounds].size.height - 50;
        return point;
    }   else if (squarePosition == MRFBottomLeftCorner) {
        point.x = 0;
        point.y = [[UIScreen mainScreen] bounds].size.height - 50;
        return point;
    }
    
    return point;
}

@end
