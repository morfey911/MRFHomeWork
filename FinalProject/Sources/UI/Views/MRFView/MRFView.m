//
//  MRFView.m
//  Objective-C UIKit
//
//  Created by Student 113 on 10/12/15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFView.h"

#import "MRFLoadingView.h"

#import "MRFMacros.h"

@interface MRFView ()
@property (nonatomic, strong)   MRFLoadingView  *loadingView;

- (void)connectLoadingView;

@end

@implementation MRFView

@dynamic loadingViewVisible;

#pragma mark -
#pragma mark Accessors

- (BOOL)isLoadingViewVisible {
    return self.loadingView.visible;
}

#pragma mark -
#pragma mark Public

- (MRFLoadingView *)newLoadingView {
    return [MRFLoadingView loadingViewWithSuperview:self];
}

- (void)showLoadingView {
    [self connectLoadingView];
    
    [self bringSubviewToFront:self.loadingView];
    self.loadingView.visible = YES;
}

- (void)hideLoadingView {
    MRFWeakify(self);
    [self.loadingView setVisible:NO animated:YES complition:^{
        MRFStrongifyAndReturnIfNil(self);
        self.loadingView = nil;
    }];
}

#pragma mark -
#pragma mark Private

- (void)connectLoadingView {
    self.loadingView = [self newLoadingView];
}

@end
