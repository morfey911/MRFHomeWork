//
//  MRFLoginView.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 24.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFView.h"

@class MRFUser;

@interface MRFLoginView : MRFView
@property (nonatomic, strong)   IBOutlet    UIButton    *loginButton;
@property (nonatomic, strong)   IBOutlet    UILabel     *userID;

@property (nonatomic, strong)   MRFUser    *userModel;

- (void)fillWithModel:(MRFUser *)model;

@end
