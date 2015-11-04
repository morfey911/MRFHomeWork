//
//  MRFObject.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 04.11.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFObject.h"

#import "NSManagedObject+IDPExtensions.h"

static NSString * const kMRFId = @"id";

@implementation MRFObject

@dynamic ID;

#pragma mark -
#pragma mark Class Methods

+ (id)managedObjectWithID:(NSString *)ID {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self.id like %@", ID];
    NSArray *objects = [self fetchEntityWithSortDescriptors:nil
                                                  predicate:predicate
                                              prefetchPaths:nil];
    
    if (objects.count > 0) {
        return [objects firstObject];
    }
    
    MRFObject *object = [self managedObject];
    object.ID = ID;
    
    return object;
}

#pragma mark -
#pragma mark Accessors

- (void)setID:(NSString *)ID {
    [self setCustomValue:ID forKey:kMRFId];
//    [self addCustomValue:ID inMutableSetForKey:kMRFId];
}

- (NSString *)ID {
    return [self customValueForKey:kMRFId];
}

- (void)removeID:(NSString *)ID {
    [self removeCustomValue:ID inMutableSetForKey:kMRFId];
}

@end
