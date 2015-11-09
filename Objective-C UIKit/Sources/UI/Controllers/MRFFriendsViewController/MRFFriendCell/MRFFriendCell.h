//
//  MRFFriendCell.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 28.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MRFImageView;
@class MRFUserModel;

@interface MRFFriendCell : UITableViewCell
@property (nonatomic, strong)   IBOutlet    UILabel         *friendNameLabel;
@property (nonatomic, strong)   IBOutlet    MRFImageView    *friendImageView;
@property (nonatomic, strong)   MRFUserModel    *userModel;

- (void)fillWithModel:(MRFUserModel *)model;

@end
