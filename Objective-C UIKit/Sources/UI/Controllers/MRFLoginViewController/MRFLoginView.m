//
//  MRFLoginView.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 24.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import <FBSDKAccessToken.h>

#import "MRFLoginView.h"

#import "MRFUser.h"

#import "MRFMacros.h"

static NSString * const kMRFLogOut = @"Log Out";
static NSString * const kMRFLogIn  = @"Log In";

@interface MRFLoginView ()
@property (nonatomic, readonly) NSString    *loginButtonTitle;

@end

@implementation MRFLoginView

@dynamic loginButtonTitle;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.userModel = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setUserModel:(MRFUser *)userModel {
    MRFSynthesizeObservingSetter(userModel);
    
    [self fillWithModel:userModel];
}

- (NSString *)loginButtonTitle {
    return self.userModel.ID ? kMRFLogOut : kMRFLogIn;
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(MRFUser *)model {
    NSString *userID = model.ID;
    
    [self.loginButton setTitle:self.loginButtonTitle forState:UIControlStateNormal];
    self.userID.text = userID;
}

#pragma mark -
#pragma mark MRFModelProtocol

- (void)objectDidChangeID:(MRFUser *)model {
    [self fillWithModel:model];
}

@end
