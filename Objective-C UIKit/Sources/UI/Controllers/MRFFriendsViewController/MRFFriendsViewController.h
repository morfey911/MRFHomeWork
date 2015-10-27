//
//  MRFFriendsViewController.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 27.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MRFUserModelObserver.h"

@interface MRFFriendsViewController : UIViewController <UITableViewDelegate,
                                                            UITableViewDataSource,
                                                            MRFUserModelObserver>

@end
