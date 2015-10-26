//
//  MRFLoginView.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 24.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MRFUserModel;

@interface MRFLoginView : UIView
@property (nonatomic, strong)   IBOutlet    UIButton    *loginButton;
@property (nonatomic, strong)   IBOutlet    UILabel     *userID;
@property (nonatomic, strong)   MRFUserModel    *userModel;

- (void)fillWithModel:(MRFUserModel *)model;

@end
