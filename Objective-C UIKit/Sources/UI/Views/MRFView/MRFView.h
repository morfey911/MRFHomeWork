//
//  MRFView.h
//  Objective-C UIKit
//
//  Created by Student 113 on 10/12/15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MRFLoadingView;

@interface MRFView : UIView

//for overloading
- (MRFLoadingView *)loadingView;

- (void)showLoadingView;
- (void)hideLoadingView;

@end
