//
//  MRFLoadingView.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 27.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MRFLoadingView : UIView
@property (nonatomic, getter=isVisible)   BOOL    visible;

+ (instancetype)loadingViewWithSuperview:(UIView *)superview;

- (void)setVisible:(BOOL)visible animated:(BOOL)animated;
- (void)setVisible:(BOOL)visible animated:(BOOL)animated complition:(void(^)(void))block;


@end
