//
//  MRFInfoView.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 17.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MRFView.h"

@interface MRFInfoView : MRFView
@property (nonatomic, strong)   IBOutlet    UITableView     *tableView;
@property (nonatomic, strong)   IBOutlet    UIButton        *editButton;

@property (nonatomic, assign, getter=isEditing)   BOOL    editing;

@end
