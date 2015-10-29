//
//  MRFFriendDetailView.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 29.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFView.h"

@class MRFImageView;
@class MRFUserModel;

@interface MRFFriendDetailView : MRFView
@property (nonatomic, strong)   IBOutlet    UILabel         *userIDLabel;
@property (nonatomic, strong)   IBOutlet    UILabel         *nameLabel;
@property (nonatomic, strong)   IBOutlet    UILabel         *emailLabel;
@property (nonatomic, strong)   IBOutlet    MRFImageView    *friendImageView;
@property (nonatomic, strong)   MRFUserModel    *model;

@end
