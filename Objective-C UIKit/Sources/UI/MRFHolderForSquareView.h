//
//  MRFHolderForSquareView.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 08.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MRFSquarePositionType) {
    MRFTopLeftCorner,
    MRFTopRightCorner,
    MRFBottomLeftCorner,
    MRFBottomRightCorner,
    MRFSquarePositionCount
};

@interface MRFHolderForSquareView : UIView
@property (nonatomic, strong)   IBOutlet    UIView      *squareView;
@property (nonatomic, strong)   IBOutlet    UIButton    *startButton;

@property (nonatomic, unsafe_unretained)    MRFSquarePositionType   squarePosition;

- (void)setSquarePosition:(MRFSquarePositionType)position
                 animated:(BOOL)animated;

- (void)setSquarePosition:(MRFSquarePositionType)position
                 animated:(BOOL)animated
        completionHandler:(void(^)(void))handler;

- (IBAction)onClickStartButton:(id)sender;

@end
