//
//  UITableView+MRFExtentions.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 20.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFArrayChangesModel.h"

#import "UITableView+MRFExtensions.h"
#import "UINib+MRFExtensions.h"

@implementation UITableView (MRFExtensions)

- (id)dequeueReusableCellWithClass:(Class)class {
    id cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass(class)];
    
    if (!cell) {
        cell = [UINib objectWithClass:class];
    }
    
    return cell;
}

- (void)updateWithChanges:(MRFArrayChangesModel *)changes {
    UITableView *tableView = self;
    NSIndexPath *sourcePosition = [changes getSourcePosition];
    
    switch (changes.state) {
        case MRFArrayModelAppendChanges:
            [tableView insertRowsAtIndexPaths:@[sourcePosition] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
            
        case MRFArrayModelDeleteChanges:
            [tableView deleteRowsAtIndexPaths:@[sourcePosition] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
            
        case MRFArrayModelMoveChanges:
            [tableView moveRowAtIndexPath:sourcePosition toIndexPath:[changes getDestinationPosition]];
            break;
            
        default:
            break;
    }
}

@end
