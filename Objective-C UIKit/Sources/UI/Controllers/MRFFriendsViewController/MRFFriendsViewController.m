//
//  MRFFriendsViewController.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 27.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFFriendsViewController.h"
#import "MRFFriendsView.h"

#import "MRFUserModel.h"
#import "MRFBaseContext.h"
#import "MRFFBUserContext.h"

#import "MRFMacros.h"

MRFViewControllerBaseViewProperty(MRFFriendsViewController, friendsView, MRFFriendsView)

@interface MRFFriendsViewController ()

@end

@implementation MRFFriendsViewController

#pragma mark -
#pragma mark Accessors

- (void)setUserModel:(MRFUserModel *)userModel {
    MRFSynthesizeObservingSetter(userModel);
    
    self.userContext = [[MRFFBUserContext alloc] initWithModel:self.userModel];
}

- (void)setUserContext:(MRFBaseContext *)userContext {
    MRFSynthesizeContextSetter(userContext);
}

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.friendsView showLoadingView];
    self.friendsView.userModel = self.userModel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
