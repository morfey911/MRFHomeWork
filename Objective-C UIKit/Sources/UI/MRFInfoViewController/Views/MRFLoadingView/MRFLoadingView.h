//
//  MRFLoadingView.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 27.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MRFLoadingView : UIView
@property (nonatomic, readonly, getter=isVisible) BOOL    visible;

+ (instancetype)loadingViewForSuperview:(UIView *)superview;

- (void)show;
- (void)hide;

- (void)showWithCompletion:(void(^)(void))block;
- (void)hideWithCompletion:(void(^)(void))block;
@end
