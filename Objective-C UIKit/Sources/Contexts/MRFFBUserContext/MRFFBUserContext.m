//
//  MRFFBUserContext.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 28.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFFBUserContext.h"

#import "MRFFBRequestConstants.h"

#import "MRFUserModel.h"
#import "MRFArrayModel.h"

@implementation MRFFBUserContext

#pragma mark -
#pragma mark MRFFBGraphRequestContext

- (NSString *)graphPath {
    return kMRFLogedUser;
}

- (NSDictionary *)graphPathParameters {
    return @{@"fields":@"name,email,picture{url},friends{id,name,picture{url}}",};
}

- (void)parseWithResult:(id)result error:(NSError *)error {
    [self parseBasicInfoWithResult:result];
    [self parseFriendsInfoWithResult:result];
}

#pragma mark -
#pragma mark Private

- (void)parseBasicInfoWithResult:(id)result {
    MRFUserModel *model = self.model;
    
    model.name = result[kMRFName];
    model.email = result[kMRFEmail];
    model.imageURL = [NSURL URLWithString:result[kMRFPicture][kMRFData][kMRFURL]];
    
    self.model.state = MRFModelDidLoad;
}

- (void)parseFriendsInfoWithResult:(id)result {
    MRFArrayModel *friendsModel = self.model.friends;
    NSArray *friends = result[kMRFFriends][kMRFData];
    
    [friendsModel performBlockWithoutNotification:^{
        for (id friend in friends) {
            MRFUserModel *user = [MRFUserModel new];
            user.userID = friend[kMRFUserID];
            user.name = friend[kMRFName];
            user.imageURL = [NSURL URLWithString:friend[kMRFPicture][kMRFData][kMRFURL]];
            
            [friendsModel addModel:user];
        }
    }];
    
    friendsModel.state = MRFModelDidLoad;
}

@end
