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

@interface MRFLoadingView ()
@property (nonatomic, assign, getter=isVisible)   BOOL    visible;

- (void)animateWithState:(BOOL)state;

@end

@implementation MRFLoadingView

#pragma mark -
#pragma mark Initializations and Deallocations

+ (instancetype)addLoadingToSelfSubviews:(UIView *)selfView {
    MRFLoadingView *object = [UINib objectWithClass:[self class]];
    
    [selfView addSubview:object];

    object.frame = selfView.bounds;

    return object;
}

#pragma mark -
#pragma mark Public

- (void)hide {
    [self animateWithState:NO];
}

- (void)show {
    [self animateWithState:YES];
}

#pragma mark -
#pragma mark Private

- (void)animateWithState:(BOOL)state {
    NSUInteger duration = self.animated ? kMRFAnimateDuration : 0;
    
    [UIView animateWithDuration:duration animations:^{
        self.alpha = (CGFloat)state;
    } completion:^(BOOL finished) {
        if (finished) {
            self.visible = YES;
        }
    }];
}

@end
