//
//  UITableView+MRFExtentions.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 20.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "UITableView+MRFExtentions.h"
#import "UINib+MRFExtentions.h"

@implementation UITableView (MRFExtentions)

- (id)dequeueReusableCellWithClass:(Class)cls {
    id cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass(cls)];
    
    if (!cell) {
        cell = [UINib objectWithClass:cls];
    }
    
    return cell;
}

@end
