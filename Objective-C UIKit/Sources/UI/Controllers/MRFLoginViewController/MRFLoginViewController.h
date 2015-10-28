//
//  MRFLoginViewController.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 24.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

// test user email - eokvzzh_zuckerstein_1446058004@tfbnw.net
// test user pass  - 9021090210


#import <UIKit/UIKit.h>

#import "MRFUserModelObserver.h"

@class MRFBaseContext;

@interface MRFLoginViewController : UIViewController <MRFUserModelObserver>

- (IBAction)onLoginButton:(id)sender;

@end
