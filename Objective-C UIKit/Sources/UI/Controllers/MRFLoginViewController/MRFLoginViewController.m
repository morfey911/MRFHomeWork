//
//  MRFLoginViewController.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 24.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import <FBSDKLoginManager.h>
#import <FBSDKAccessToken.h>

#import "MRFLoginViewController.h"
#import "MRFLoginView.h"

#import "MRFFriendsViewController.h"

#import "MRFUserModel.h"
#import "MRFFBLoginContext.h"

#import "UIViewController+MRFExtensions.h"

#import "MRFMacros.h"

MRFViewControllerBaseViewProperty(MRFLoginViewController, loginView, MRFLoginView);

@interface MRFLoginViewController ()
@property (nonatomic, strong)   MRFBaseContext  *loginContext;
@property (nonatomic, strong)   MRFUserModel    *userModel;

- (void)logOutFromFacebook;

@end

@implementation MRFLoginViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.userModel = [MRFUserModel new];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setUserModel:(MRFUserModel *)userModel {
    MRFSynthesizeObservingSetter(userModel);
}

- (void)setLoginContext:(MRFBaseContext *)loginContext {
    MRFSynthesizeContextSetter(loginContext);
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.loginView.userModel = self.userModel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onLoginButton:(id)sender {
    if (self.userModel.userID) {
        [self logOutFromFacebook];
    } else {
        self.loginContext = [[MRFFBLoginContext alloc] initWithModel:self.userModel];
    }
}

#pragma mark -
#pragma mark Private

- (void)logOutFromFacebook {
    MRFUserModel *userModel = self.userModel;
    
    [[[FBSDKLoginManager alloc] init] logOut];
    userModel.userID = nil;
    userModel.state = MRFModelNotLoaded;
}

#pragma mark -
#pragma mark MRFUserModel

- (void)userModelDidChangeID:(MRFUserModel *)model {
    if (model.userID) {
        MRFFriendsViewController *controller = [MRFFriendsViewController controller];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

@end
