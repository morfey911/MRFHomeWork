//
//  MRFFBUserContext.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 28.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import <FBSDKCoreKit.h>

#import "MRFFBUserContext.h"

#import "MRFUserModel.h"
#import "MRFArrayModel.h"

@interface MRFFBUserContext ()
@property (nonatomic, strong)   MRFUserModel                *userModel;
@property (nonatomic, strong)   FBSDKGraphRequestConnection *connection;
@property (nonatomic, readonly) FBSDKGraphRequest           *request;
@property (nonatomic, readonly) id                          handler;
@property (nonatomic, readonly) NSString                    *graphPath;

@end

@implementation MRFFBUserContext

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithModel:(MRFUserModel *)userModel {
    self = [super init];
    if (self) {
        self.userModel = userModel;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    return @"me?fields=name,email,picture,friends";
}

- (FBSDKGraphRequest *)request {
    return [[FBSDKGraphRequest alloc] initWithGraphPath:self.graphPath parameters:nil];
}

- (void)setConnection:(FBSDKGraphRequestConnection *)connection {
    if (_connection != connection) {
        [_connection cancel];
        _connection = connection;
    }
}

- (id)handler {
    return ^(FBSDKGraphRequestConnection *connection,
             id result,
             NSError *error)
    {
        [self parseWithResult:result error:error];
    };
}

#pragma mark -
#pragma mark Public

- (void)parseWithResult:(id)result error:(NSError *)error {
    [self parseBasicInfoWithResult:result];
    [self parseFriendsInfoWithResult:result];
    
    self.userModel.state = MRFModelDidLoad;
}

#pragma mark -
#pragma mark Private

- (void)parseBasicInfoWithResult:(id)result {
    self.userModel.name = result[@"name"];
    self.userModel.email = result[@"email"];
    self.userModel.imageURL = [NSURL URLWithString:result[@"picture"][@"data"][@"url"]];
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
    
    self.userModel.friends = friendsModel;
}

#pragma mark -
#pragma mark MRFBaseContext

- (void)execute {
    self.connection = [self.request startWithCompletionHandler:self.handler];
}

- (void)cancel {
    self.connection = nil;
}

@end
