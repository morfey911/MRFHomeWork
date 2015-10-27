//
//  MRFLoginViewController.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 24.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MRFUserModelObserver.h"

@class MRFBaseContext;

@interface MRFLoginViewController : UIViewController <MRFUserModelObserver>

- (IBAction)onLoginButton:(id)sender;

@end
