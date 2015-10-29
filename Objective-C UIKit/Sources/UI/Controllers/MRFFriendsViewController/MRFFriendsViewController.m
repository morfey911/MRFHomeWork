//
//  MRFFriendsViewController.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 27.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFFriendsViewController.h"
#import "MRFFriendDetailViewController.h"
#import "MRFFriendsView.h"

#import "MRFFriendCell.h"

#import "MRFArrayModel.h"
#import "MRFUserModel.h"

#import "MRFBaseContext.h"
#import "MRFFBUserContext.h"

#import "UITableView+MRFExtensions.h"
#import "UIViewController+MRFExtensions.h"

#import "MRFMacros.h"

MRFViewControllerBaseViewProperty(MRFFriendsViewController, friendsView, MRFFriendsView)

@interface MRFFriendsViewController ()
@property (nonatomic, strong)   MRFBaseContext    *userContext;
@property (nonatomic, assign)   MRFArrayModel     *friendsModel;

@end

@implementation MRFFriendsViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.userModel = nil;
    self.userContext = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setUserModel:(MRFUserModel *)userModel {
    if (_userModel != userModel) {
        _userModel = userModel;
        
        self.friendsModel = userModel.friends;
        self.userContext = [[MRFFBUserContext alloc] initWithModel:self.userModel];
    }
}

- (void)setFriendsModel:(MRFArrayModel *)friendsModel {
    MRFSynthesizeObservingSetter(friendsModel);
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
    return self.friendsModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MRFFriendCell *cell = [tableView dequeueReusableCellWithClass:[MRFFriendCell class]];
    
    [cell fillWithModel:self.friendsModel[indexPath.row]];
    
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MRFFriendDetailViewController *controller = [MRFFriendDetailViewController controller];
    controller.model = self.friendsModel[indexPath.row];
    
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark -
#pragma mark MRFModelProtocol

- (void)modelDidLoad:(MRFArrayModel *)model {
    [self.friendsView.friendsTableView reloadData];
}

@end
