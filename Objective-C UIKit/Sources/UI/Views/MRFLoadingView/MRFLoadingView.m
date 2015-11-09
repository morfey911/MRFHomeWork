//
//  MRFLoadingView.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 27.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFLoadingView.h"

#import "UINib+MRFExtensions.h"

static const NSTimeInterval kMRFAnimateDuration    = 1;
static const CGFloat        kMRFVisibleAlpha       = 1.0;

@interface MRFLoadingView ()

- (void)animateWithVisibleState:(BOOL)state
                       duration:(NSUInteger)duration
              completionHandler:(void(^)(void))handler;

@end

@implementation MRFLoadingView

#pragma mark -
#pragma mark Class methods

+ (instancetype)loadingViewWithSuperview:(UIView *)superview {
    MRFLoadingView *object = [UINib objectWithClass:[self class]];
    
    [superview addSubview:object];

    object.frame = superview.bounds;

    return object;
}

#pragma mark -
#pragma mark Accessors

- (void)setVisible:(BOOL)visible {
    [self setVisible:visible animated:YES];
}

- (void)setVisible:(BOOL)visible animated:(BOOL)animated {
    [self setVisible:visible animated:animated complition:nil];
}

- (void)setVisible:(BOOL)visible animated:(BOOL)animated complition:(void(^)(void))block {
    NSTimeInterval duration = animated ? kMRFAnimateDuration : 0;
    
    [self animateWithVisibleState:visible duration:duration completionHandler:block];
}

#pragma mark -
#pragma mark Private

- (void)animateWithVisibleState:(BOOL)state
                       duration:(NSUInteger)duration
              completionHandler:(void(^)(void))handler
{
    [UIView animateWithDuration:duration animations:^{
        self.alpha = state ? kMRFVisibleAlpha : 0;
    } completion:^(BOOL finished) {
        _visible = state;
        
        if (handler) {
            handler();
        }
        
    }];
}

@end
