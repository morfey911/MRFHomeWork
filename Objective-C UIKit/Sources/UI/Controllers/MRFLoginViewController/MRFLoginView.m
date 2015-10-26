//
//  MRFLoginView.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 24.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import <FBSDKAccessToken.h>

#import "MRFLoginView.h"

#import "MRFUserModel.h"

#import "MRFMacros.h"

@interface MRFLoginView ()
@property (nonatomic, readonly) NSString    *loginButtonTitle;

@end

@implementation MRFLoginView

@dynamic loginButtonTitle;

#pragma mark -
#pragma mark Accessors

- (void)setUserModel:(MRFUserModel *)userModel {
    MRFSynthesizeObservingSetter(userModel);
    
    [self fillWithModel:userModel];
}

- (NSString *)loginButtonTitle {
    return self.userModel.userID ? @"Log Out" : @"Log In";
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(MRFUserModel *)model {
    NSString *userID = model.userID;
    
    [self.loginButton setTitle:self.loginButtonTitle forState:UIControlStateNormal];
    self.userID.text = userID;
    self.friendsButton.hidden = userID ? NO : YES;
}

#pragma mark -
#pragma mark MRFModelProtocol

- (void)userModelDidChangeID:(MRFUserModel *)model {
    [self fillWithModel:model];
}

@end
