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

@interface MRFFBUserContext ()
@property (nonatomic, readonly) MRFUserModel    *userModel;

- (void)fillUser:(MRFUserModel *)user withResult:(NSDictionary *)result;

@end

@implementation MRFFBUserContext

@dynamic userModel;

#pragma mark -
#pragma mark Accessors

- (MRFUserModel *)userModel {
    return (MRFUserModel *)self.model;
}

#pragma mark -
#pragma mark MRFFBGraphRequestContext

- (NSString *)graphPath {
    return kMRFLogedUser;
}

- (NSDictionary *)graphPathParameters {
    return @{@"fields":@"name,email,picture{url},friends{id,name,picture{url}}",};
}

- (void)parseResult:(id)result error:(NSError *)error {
    [self parseBasicInfoWithResult:result];
    [self parseFriendsInfoWithResult:result];
}

#pragma mark -
#pragma mark Private

- (void)parseBasicInfoWithResult:(NSDictionary *)result {
    [self fillUser:self.userModel withResult:result];
}

- (void)parseFriendsInfoWithResult:(NSDictionary *)result {
    MRFArrayModel *friendsModel = self.userModel.friends;
    NSArray *friends = result[kMRFFriends][kMRFData];
    
    [friendsModel performBlockWithoutNotification:^{
        for (id friend in friends) {
            MRFUserModel *user = [MRFUserModel new];
            [self fillUser:user withResult:friend];
            
            [friendsModel addModel:user];
        }
    }];
    
    friendsModel.state = MRFModelDidLoad;
}

- (void)fillUser:(MRFUserModel *)user withResult:(NSDictionary *)result {
    user.userID = result[kMRFUserID];
    user.name = result[kMRFName];
    user.email = result[kMRFEmail];
    user.imageURL = [NSURL URLWithString:result[kMRFPicture][kMRFData][kMRFURL]];
    user.state = MRFModelDidLoad;
}

@end
