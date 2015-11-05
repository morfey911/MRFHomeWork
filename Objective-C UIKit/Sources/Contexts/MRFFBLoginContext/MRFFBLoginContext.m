//
//  MRFFBLoginContext.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 24.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFFBLoginContext.h"

#import <FBSDKLoginKit.h>
#import <FBSDKAccessToken.h>

#import "ActiveRecordKit.h"

#import "MRFUser.h"

#import "MRFFBRequestConstants.h"

@interface MRFFBLoginContext ()
@property (nonatomic, strong)   MRFUser     *model;
@property (nonatomic, readonly) NSArray     *permissions;

- (void)logInToFacebook;
- (void)finalizeLogIn;
- (void)addUserToContextIfNeeded;

@end

@implementation MRFFBLoginContext

@dynamic permissions;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithModel:(MRFUser *)model {
    self = [super init];
    if (self) {
        self.model = model;
    }
    
    return self;
}

#pragma mark -
#pragma Accessors

- (NSArray *)permissions {
    return @[kMRFPublicProfile, kMRFEmail, kMRFUserFriends];
}

#pragma mark -
#pragma mark MRFBaseContext

- (void)execute {
    FBSDKAccessToken *token = [FBSDKAccessToken currentAccessToken];
    
    if (token.userID) {
        [self finalizeLogIn];
    } else {
        [self logInToFacebook];
    }
}

- (void)cancel {
    
}

#pragma mark -
#pragma mark Private

- (void)logInToFacebook {
    FBSDKLoginManager *loginManager = [FBSDKLoginManager new];
    
    id block = ^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            NSLog(@"Process error");
        } else if (result.isCancelled) {
            NSLog(@"Cancelled");
        } else {
            NSLog(@"Logged in");
            [self finalizeLogIn];
        }
    };
    
    [loginManager logInWithReadPermissions:self.permissions
                        fromViewController:nil
                                   handler:block];
}

- (void)finalizeLogIn {
    FBSDKAccessToken *token = [FBSDKAccessToken currentAccessToken];
    
    if (token) {
        MRFUser *user = self.model;
        
        user.ID = token.userID;
        [user saveManagedObject];
    }
}

@end
