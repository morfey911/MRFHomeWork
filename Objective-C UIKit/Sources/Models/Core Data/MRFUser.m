//
//  DBUser.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 02.11.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFUser.h"

#import "IDPObjCRuntime.h"

#import "NSManagedObject+IDPExtensions.h"

@implementation MRFUser

@dynamic name;
@dynamic email;
@dynamic friends;
@dynamic images;

#pragma mark -
#pragma mark Public

- (void)addFriend:(MRFUser *)value {
    [self addCustomValue:value inMutableSetForKey:IDPStringFromSEL(friends)];
}

- (void)removeFriend:(MRFUser *)value {
    [self removeCustomValue:value inMutableSetForKey:IDPStringFromSEL(friends)];
}

- (void)addImage:(DBImage *)value {
    [self addCustomValue:value inMutableSetForKey:IDPStringFromSEL(images)];
}

- (void)removeImage:(DBImage *)value {
    [self addCustomValue:value inMutableSetForKey:IDPStringFromSEL(images)];
}

@end
