//
//  MRFMainView.h
//  Final Project
//
//  Created by Yurii Mamurko on 09.11.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFView.h"

@class MRFFetchedArrayModel;

@interface MRFMainView : MRFView
@property (nonatomic, strong)   IBOutlet    UITableView *tableView;
@property (nonatomic, strong)   IBOutlet    UIButton    *statisticButton;
@property (nonatomic, strong)   IBOutlet    UILabel     *droveLabel;
@property (nonatomic, strong)   IBOutlet    UILabel     *fuelConsumptionLabel;
@property (nonatomic, strong)   IBOutlet    UILabel     *moneySpentLabel;

@end
