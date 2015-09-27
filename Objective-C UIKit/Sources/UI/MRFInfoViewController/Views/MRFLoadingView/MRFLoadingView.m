//
//  MRFLoadingView.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 27.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFLoadingView.h"

@implementation MRFLoadingView

- (void)hideWithAnimation {
    [UIView animateWithDuration:2 animations:^{
        self.alpha = 0;
    }];
}

- (void)showWithAnimation {
    [UIView animateWithDuration:2 animations:^{
        self.alpha = 1;
    }];
}

@end
