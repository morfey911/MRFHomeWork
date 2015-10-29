//
//  MRFFBUserContext.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 28.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFFBUserContext.h"

#import "MRFUserModel.h"
#import "MRFArrayModel.h"

@implementation MRFFBUserContext

#pragma mark -
#pragma mark MRFFBGraphRequestContext

- (NSString *)graphPath {
    return @"me?fields=name,email,picture,friends";
}

- (void)parseWithResult:(id)result error:(NSError *)error {
    [self parseBasicInfoWithResult:result];
    [self parseFriendsInfoWithResult:result];
    
    self.model.state = MRFModelDidLoad;
}

#pragma mark -
#pragma mark Private

- (void)parseBasicInfoWithResult:(id)result {
    self.model.name = result[@"name"];
    self.model.email = result[@"email"];
    self.model.imageURL = [NSURL URLWithString:result[@"picture"][@"data"][@"url"]];
}

- (void)parseFriendsInfoWithResult:(id)result {
    MRFArrayModel *friendsModel = [MRFArrayModel new];
    NSArray *friends = result[@"friends"][@"data"];
    
    for (id friend in friends) {
        MRFUserModel *user = [MRFUserModel new];
        user.userID = friend[@"userID"];
        user.name = friend[@"name"];
        [friendsModel addModel:user];
    }
    
    self.model.friends = friendsModel;
}

@end
