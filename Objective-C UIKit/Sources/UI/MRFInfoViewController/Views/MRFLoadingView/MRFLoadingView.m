//
//  MRFLoadingView.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 27.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFLoadingView.h"

static const NSUInteger kMRFAnimateDuration = 2;
static const CGFloat    kMRFHideAlpha       = 0;
static const CGFloat    kMRFShowAlpha       = 1;

@implementation MRFLoadingView

- (void)hideWithAnimation {
    [UIView animateWithDuration:kMRFAnimateDuration animations:^{
        self.alpha = kMRFHideAlpha;
    }];
}

- (void)showWithAnimation {
    [UIView animateWithDuration:kMRFAnimateDuration animations:^{
        self.alpha = kMRFShowAlpha;
    }];
}

@end
