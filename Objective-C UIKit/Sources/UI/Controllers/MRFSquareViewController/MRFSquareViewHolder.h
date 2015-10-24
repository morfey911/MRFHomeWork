//
//  MRFSquareViewHolder.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 08.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MRFSquarePositionType) {
    MRFTopLeftSquareCorner,
    MRFTopRightSquareCorner,
    MRFBottomLeftSquareCorner,
    MRFBottomRightSquareCorner,
    MRFSquarePositionCount
};

@interface MRFSquareViewHolder : UIView
@property (nonatomic, strong)   IBOutlet    UIView      *squareView;
@property (nonatomic, strong)   IBOutlet    UIButton    *animateButton;

@property (nonatomic, assign, getter=isAnimating)   BOOL    animating;

@property (nonatomic, assign)   MRFSquarePositionType   squarePosition;


- (void)setSquarePosition:(MRFSquarePositionType)position animated:(BOOL)animated;

- (void)setSquarePosition:(MRFSquarePositionType)position
                 animated:(BOOL)animated
        completionHandler:(void(^)(BOOL finished))handler;

@end
