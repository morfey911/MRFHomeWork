//
//  MRFView.m
//  Objective-C UIKit
//
//  Created by Student 113 on 10/12/15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFView.h"

#import "MRFLoadingView.h"

@interface MRFView ()
@property (nonatomic, strong)   MRFLoadingView  *loadingView;

- (void)connectLoadingView;

@end

@implementation MRFView

#pragma mark -
#pragma mark Public

- (void)showLoadingView {
    [self connectLoadingView];
    
    self.loadingView.visible = YES;
}

- (void)hideLoadingView {
    self.loadingView.visible = NO;
}

#pragma mark -
#pragma mark Private

- (void)connectLoadingView {
    if (nil == self.loadingView) {
        self.loadingView = [MRFLoadingView loadingViewWithSuperview:self];
    }
}

@end