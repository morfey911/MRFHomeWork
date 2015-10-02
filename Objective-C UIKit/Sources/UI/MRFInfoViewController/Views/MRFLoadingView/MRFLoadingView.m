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
static const CGFloat    kMRFShowAlpha       = 1;

@interface MRFLoadingView ()
@property (nonatomic, assign, getter=isVisible)   BOOL    visible;

- (void)animateWithState:(BOOL)state completionHandler:(void(^)(void))handler;

@end

@implementation MRFLoadingView

#pragma mark -
#pragma mark Initializations and Deallocations

+ (instancetype)loadingViewForSuperview:(UIView *)superview {
    MRFLoadingView *object = [UINib objectWithClass:[self class]];
    
    [superview addSubview:object];

    object.frame = superview.bounds;

    return object;
}

#pragma mark -
#pragma mark Public

- (void)show {
    [self showWithCompletion:nil];
}

- (void)hide {
    [self hideWithCompletion:nil];
}

- (void)showWithCompletion:(void(^)(void))block {
    [self animateWithState:YES completionHandler:block];
}

- (void)hideWithCompletion:(void(^)(void))block {
    [self animateWithState:NO completionHandler:block];
}

#pragma mark -
#pragma mark Private

- (void)animateWithState:(BOOL)state completionHandler:(void(^)(void))handler {
    [UIView animateWithDuration:kMRFAnimateDuration animations:^{
        self.alpha = state ? kMRFShowAlpha : 0;
    } completion:^(BOOL finished) {
        self.visible = YES;
        
        if (handler) {
            handler();
        }
        
    }];
}

@end
