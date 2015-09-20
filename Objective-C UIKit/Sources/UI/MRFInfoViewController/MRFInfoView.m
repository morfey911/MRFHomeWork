//
//  MRFInfoView.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 17.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFInfoView.h"

@interface MRFInfoView ()

- (void)changeEditingMode;

@end

@implementation MRFInfoView

#pragma mark -
#pragma mark Accessors

- (void)setEditing:(BOOL)editing {
    if (_editing != editing) {
        _editing = editing;
        
        [self changeEditingMode];
    }
}

#pragma mark -
#pragma Private

- (void)changeEditingMode {
    UITableView *tableView = self.tableView;
    
    self.editing ? [tableView setEditing:YES animated:YES] : [tableView setEditing:NO animated:YES];
}

@end
