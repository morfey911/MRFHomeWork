//
//  MRFLoginViewController.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 24.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import <FBSDKLoginManager.h>
#import <FBSDKAccessToken.h>

#import "IDPCoreDataManager.h"

#import "MRFLoginViewController.h"
#import "MRFLoginView.h"

#import "MRFFriendsViewController.h"

#import "MRFUser.h"
#import "MRFArrayModel.h"
#import "MRFFBLoginContext.h"

#import "UIViewController+MRFExtensions.h"
#import "NSManagedObject+IDPExtensions.h"

#import "MRFDispatch.h"
#import "MRFMacros.h"

MRFViewControllerBaseViewProperty(MRFLoginViewController, loginView, MRFLoginView);

@interface MRFLoginViewController ()
@property (nonatomic, strong)   MRFBaseContext  *loginContext;
@property (nonatomic, strong)   MRFUser *userModel;

- (void)logOutFromFacebook;
- (void)pushFriendsViewController;

@end

@implementation MRFLoginViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.userModel = nil;
    self.loginContext = nil;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [IDPCoreDataManager sharedManagerWithMomName:@"Objective-c UIKit"];
        self.userModel = [MRFUser managedObject];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setUserModel:(MRFUser *)userModel {
    MRFSynthesizeObservingSetter(userModel);
}

- (void)setLoginContext:(MRFBaseContext *)loginContext {
    MRFSynthesizeContextSetter(loginContext);
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.loginView.userModel = self.userModel;
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onLoginButton:(id)sender {
    if (self.userModel.ID) {
        [self logOutFromFacebook];
    } else {
        self.loginContext = [[MRFFBLoginContext alloc] initWithModel:self.userModel];
    }
}

#pragma mark -
#pragma mark Private

- (void)logOutFromFacebook {
    MRFUser *userModel = self.userModel;
    
    [[FBSDKLoginManager new] logOut];
    userModel.ID = nil;
    userModel.state = MRFModelNotLoaded;
}

- (void)pushFriendsViewController {
    MRFFriendsViewController *controller = [MRFFriendsViewController controller];
    MRFUser *userModel = self.userModel;
    
    userModel.friends = [MRFArrayModel new];
    controller.userModel = userModel;
    
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark -
#pragma mark MRFUserModel

- (void)objectDidChangeID:(MRFUser *)model {
    if (model.ID) {
        MRFDispatchAsyncOnMainThread(^{
//            [self pushFriendsViewController];
        });
    }
}

@end
