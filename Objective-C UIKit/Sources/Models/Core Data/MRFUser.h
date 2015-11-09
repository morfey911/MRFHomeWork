//
//  MRFUser.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 02.11.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFObject.h"

@class DBImage;

@interface MRFUser : MRFObject
@property (nonatomic, strong)   NSString    *name;
@property (nonatomic, strong)   NSString    *email;
@property (nonatomic, strong)   NSSet       *friends;
@property (nonatomic, strong)   NSSet       *images;

@end

@interface MRFUser (CoreDataGeneratedAccessors)

- (void)addFriend:(MRFUser *)value;
- (void)removeFriend:(MRFUser *)value;
- (void)addFriends:(NSSet *)values;
- (void)removeFriends:(NSSet *)values;

- (void)addImage:(DBImage *)value;
- (void)removeImage:(DBImage *)value;
- (void)addImages:(NSSet *)values;
- (void)removeImages:(NSSet *)values;

@end
