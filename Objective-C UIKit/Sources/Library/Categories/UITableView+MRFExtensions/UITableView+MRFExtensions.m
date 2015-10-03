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

@implementation UITableView (MRFExtensions)

- (id)dequeueReusableCellWithClass:(Class)class {
    id cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass(class)];
    
    if (!cell) {
        cell = [UINib objectWithClass:class];
    }
    
    return cell;
}

- (void)updateWithChanges:(id)changes {
    UITableView *tableView = self;
    
    switch ([changes state]) {
        case MRFArrayModelAppendChanges:
            [tableView insertRowsAtIndexPaths:@[[changes indexPath]] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
            
        case MRFArrayModelDeleteChanges:
            [tableView deleteRowsAtIndexPaths:@[[changes indexPath]] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
            
        case MRFArrayModelMoveChanges:
            [tableView moveRowAtIndexPath:[changes sourceIndexPath]
                              toIndexPath:[changes destinationIndexPath]];
            break;
            
        default:
            break;
    }
}

@end
