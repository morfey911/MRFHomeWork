//
//  MRFInfoView.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 17.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MRFInfoView : UIView
@property (nonatomic, strong)   IBOutlet    UITableView *tableView;
@property (nonatomic, strong)   IBOutlet    UIButton    *addButton;
@property (nonatomic, strong)   IBOutlet    UIButton    *removeButton;
@property (nonatomic, strong)   IBOutlet    UIButton    *resortButton;

@property (nonatomic, assign)   BOOL    editing;

@end
