//
//  MRFLoadingView.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 27.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MRFLoadingView : UIView
@property (nonatomic, readonly) BOOL    visible;

+ (instancetype)addLoadingToSelfSubviews:(UIView *)selfView;

- (void)hideWithAnimation;

- (void)showWithAnimation;

@end
