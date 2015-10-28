//
//  MRFFriendsViewController.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 27.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MRFUserModelObserver.h"

@class MRFUserModel;
@class MRFBaseContext;

@interface MRFFriendsViewController : UIViewController <UITableViewDelegate,
                                                            UITableViewDataSource,
                                                            MRFUserModelObserver>
@property (nonatomic, strong)   MRFUserModel      *userModel;
@property (nonatomic, strong)   MRFBaseContext    *userContext;

@end
