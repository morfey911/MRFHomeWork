//
//  UITableView+MRFExtentions.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 20.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MRFArrayChangesModel;

@interface UITableView (MRFExtensions)

- (id)dequeueReusableCellWithClass:(Class)cls;
- (void)updateWithChanges:(MRFArrayChangesModel *)changes;
- (void)updateWithChanges:(MRFArrayChangesModel *)changes rowAnimation:(UITableViewRowAnimation)rowAnimation;

@end
