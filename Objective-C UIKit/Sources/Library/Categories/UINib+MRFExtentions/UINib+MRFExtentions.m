//
//  UINib+MRFExtentions.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 20.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "UINib+MRFExtentions.h"

@implementation UINib (MRFExtentions)

#pragma mark -
#pragma mark Class methods

+ (UINib *)nibWithClass:(Class)cls {
    return [self nibWithClass:cls bundle:nil];
}

+ (UINib *)nibWithClass:(Class)cls bundle:(NSBundle *)bundle {
    return [UINib nibWithNibName:NSStringFromClass(cls) bundle:bundle];
}

+ (id)objectWithClass:(Class)cls {
    return [[self nibWithClass:cls] objectWithClass:cls];
}

#pragma mark -
#pragma mark Public

- (id)objectWithClass:(Class)cls {
    NSArray *array = [self instantiate];
    
    for (id object in array) {
        if ([object isMemberOfClass:cls]) {
            return object;
        }
    }
    
    return nil;
}

- (NSArray *)instantiate {
    return [self instantiateWithOwner:nil];
}

- (NSArray *)instantiateWithOwner:(id)ownerOrNil {
    return [self instantiateWithOwner:ownerOrNil options:nil];
}

@end
