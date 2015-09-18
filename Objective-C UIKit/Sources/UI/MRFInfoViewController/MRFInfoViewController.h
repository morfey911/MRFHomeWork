//
//  MRFInfoViewController.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 17.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MRFInfoModel;

@interface MRFInfoViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)   MRFInfoModel    *info;

- (IBAction)onAddButton:(id)sender;
- (IBAction)onRemoveButton:(id)sender;
- (IBAction)onResortButton:(id)sender;

@end
