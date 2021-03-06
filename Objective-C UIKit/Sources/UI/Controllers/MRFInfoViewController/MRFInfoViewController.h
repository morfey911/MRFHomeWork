//
//  MRFInfoViewController.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 17.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MRFModelProtocol.h"

@class MRFArrayModel;

@interface MRFInfoViewController : UIViewController <UITableViewDelegate,
                                                        UITableViewDataSource,
                                                        MRFModelProtocol>
@property (nonatomic, strong)   MRFArrayModel   *arrayModel;

- (IBAction)onEditButton:(id)sender;

@end
