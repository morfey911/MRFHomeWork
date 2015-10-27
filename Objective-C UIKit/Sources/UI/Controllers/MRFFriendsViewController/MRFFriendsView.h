//
//  MRFFriendsView.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 27.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MRFImageView;

@interface MRFFriendsView : UIView
@property (nonatomic, strong)   IBOutlet    UILabel         *userNameLabel;
@property (nonatomic, strong)   IBOutlet    MRFImageView    *userImageView;
@property (nonatomic, strong)   IBOutlet    UITableView     *friendsTableView;

@end
