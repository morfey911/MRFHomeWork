//
//  UINib+MRFExtentions.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 20.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "UINib+MRFExtensions.h"

@implementation UINib (MRFExtensions)

#pragma mark -
#pragma mark Class methods

+ (UINib *)nibWithClass:(Class)class {
    return [self nibWithClass:class bundle:nil];
}

+ (UINib *)nibWithClass:(Class)class bundle:(NSBundle *)bundle {
    return [self nibWithNibName:NSStringFromClass(class) bundle:bundle];
}

+ (id)objectWithClass:(Class)class {
    return [self objectWithClass:class owner:nil];
}

+ (id)objectWithClass:(Class)class owner:(id)owner {
    return [[self nibWithClass:class] objectWithClass:class owner:owner];
}

#pragma mark -
#pragma mark Public

- (id)objectWithClass:(Class)class {
    return [self objectWithClass:class owner:nil];
}

- (id)objectWithClass:(Class)class owner:(id)owner {
    NSArray *array = [self objectsWithOwner:owner];
    
    for (id object in array) {
        if ([object isMemberOfClass:class]) {
            return object;
        }
    }
    
    return nil;
}

- (NSArray *)objects {
    return [self objectsWithOwner:nil];
}

- (NSArray *)objectsWithOwner:(id)ownerOrNil {
    return [self instantiateWithOwner:ownerOrNil options:nil];
}

@end
