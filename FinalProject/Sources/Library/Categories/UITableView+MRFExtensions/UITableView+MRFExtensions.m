//
//  UITableView+MRFExtentions.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 20.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "UITableView+MRFExtensions.h"

#import "MRFArrayChangesModel.h"
#import "MRFPositionModel.h"
#import "MRFMovingPositionModel.h"

#import "UINib+MRFExtensions.h"
#import "MRFArrayChangesModel+UITableView.h"

@implementation UITableView (MRFExtensions)

- (id)dequeueReusableCellWithClass:(Class)class {
    id cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass(class)];
    
    if (!cell) {
        cell = [UINib objectWithClass:class];
    }
    
    return cell;
}

- (void)updateWithChanges:(MRFArrayChangesModel *)changes {
    [self updateWithChanges:changes rowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)updateWithChanges:(MRFArrayChangesModel *)changes rowAnimation:(UITableViewRowAnimation)rowAnimation {
    [self beginUpdates];
    
    [changes applyToTableView:self rowAnimation:rowAnimation];
    
    [self endUpdates];
}

@end
