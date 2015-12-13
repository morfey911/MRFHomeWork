//
//  MRFStatisticView.h
//  Final Project
//
//  Created by Yurii Mamurko on 07.12.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFView.h"

#import "BEMSimpleLineGraphView.h"

@interface MRFStatisticView : MRFView
@property (nonatomic, strong)   IBOutlet    UITableView             *tableView;
@property (nonatomic, strong)   IBOutlet    BEMSimpleLineGraphView  *graphView;

@end
