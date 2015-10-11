//
//  MRFArrayChangesModel+UITableView.h
//  
//
//  Created by Yurii Mamurko on 11.10.15.
//
//

#import <UIKit/UIKit.h>

#import "MRFArrayChangesModel.h"
#import "MRFPositionModel.h"
#import "MRFMovingPositionModel.h"

@interface MRFArrayChangesModel (UITableView)

- (void)applyToTableView:(UITableView *)tableView;
- (void)applyToTableView:(UITableView *)tableView rowAnimation:(UITableViewRowAnimation)rowAnimation;

@end

@interface MRFPositionModel (UITableView)

- (void)applyToTableView:(UITableView *)tableView;
- (void)applyToTableView:(UITableView *)tableView rowAnimation:(UITableViewRowAnimation)rowAnimation;

@end

@interface MRFMovingPositionModel (UITableView)

- (void)applyToTableView:(UITableView *)tableView;
- (void)applyToTableView:(UITableView *)tableView rowAnimation:(UITableViewRowAnimation)rowAnimation;

@end
