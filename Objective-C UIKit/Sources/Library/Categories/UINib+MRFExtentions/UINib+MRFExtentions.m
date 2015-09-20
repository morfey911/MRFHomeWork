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

+ (UINib *)nibWithClass:(Class)class {
    return [self nibWithClass:class bundle:nil];
}

+ (UINib *)nibWithClass:(Class)class bundle:(NSBundle *)bundle {
    return [UINib nibWithNibName:NSStringFromClass(class) bundle:bundle];
}

+ (id)objectWithClass:(Class)class {
    return [[self nibWithClass:class] objectWithClass:class];
}

#pragma mark -
#pragma mark Public

- (id)objectWithClass:(Class)class {
    NSArray *array = [self instantiate];
    
    for (id object in array) {
        if ([object isMemberOfClass:class]) {
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
