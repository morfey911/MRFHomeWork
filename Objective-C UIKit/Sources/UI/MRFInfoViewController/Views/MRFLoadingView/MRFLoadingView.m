//
//  MRFLoadingView.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 27.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFLoadingView.h"

#import "UINib+MRFExtensions.h"

static const NSUInteger kMRFAnimateDuration = 1;
static const CGFloat    kMRFHideAlpha       = 0;
static const CGFloat    kMRFShowAlpha       = 0.1;

@implementation MRFLoadingView

#pragma mark -
#pragma mark Initializations and Deallocations

+ (instancetype)addLoadingToSelfSubviews:(UIView *)selfView {
    MRFLoadingView *object = [UINib objectWithClass:[self class]];
    
    [selfView addSubview:object];
    [object setBounds:selfView.bounds];

    return object;
}

#pragma mark -
#pragma mark Public

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
