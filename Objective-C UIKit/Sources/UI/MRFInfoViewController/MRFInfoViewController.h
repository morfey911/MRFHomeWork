//
//  MRFInfoViewController.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 17.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MRFInfoViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

- (IBAction)onAddButton:(id)sender;
- (IBAction)onRemoveButton:(id)sender;
- (IBAction)onResortButton:(id)sender;

@end
