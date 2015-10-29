//
//  MRFFriendsViewController.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 27.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFFriendsViewController.h"
#import "MRFFriendsView.h"

#import "MRFFriendCell.h"

#import "MRFArrayModel.h"
#import "MRFUserModel.h"

#import "MRFBaseContext.h"
#import "MRFFBUserContext.h"

#import "UITableView+MRFExtensions.h"

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
    
    self.friendsView.userModel = self.userModel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.userModel.friends.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MRFFriendCell *cell = [tableView dequeueReusableCellWithClass:[MRFFriendCell class]];
    
    [cell fillWithModel:self.userModel.friends[indexPath.row]];
    
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark -
#pragma mark MRFModelProtocol

- (void)modelDidLoad:(MRFUserModel *)model {
    [self.friendsView.friendsTableView reloadData];
}

@end
