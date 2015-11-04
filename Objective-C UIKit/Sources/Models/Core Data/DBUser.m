//
//  DBUser.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 02.11.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "DBUser.h"

#import "IDPObjCRuntime.h"

#import "NSManagedObject+IDPExtensions.h"

@implementation DBUser

@dynamic name;
@dynamic email;
@dynamic friends;
@dynamic images;

#pragma mark -
#pragma mark Public

- (void)addFriend:(DBUser *)value {
    [self addCustomValue:value inMutableSetForKey:IDPStringFromSEL(friends)];
}

- (void)removeFriend:(DBUser *)value {
    [self removeCustomValue:value inMutableSetForKey:IDPStringFromSEL(friends)];
}

- (void)addImage:(DBImage *)value {
    [self addCustomValue:value inMutableSetForKey:IDPStringFromSEL(images)];
}

- (void)removeImage:(DBImage *)value {
    [self addCustomValue:value inMutableSetForKey:IDPStringFromSEL(images)];
}

@end
