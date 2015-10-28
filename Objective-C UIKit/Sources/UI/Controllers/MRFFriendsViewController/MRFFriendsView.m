//
//  MRFFriendsView.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 27.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFFriendsView.h"

#import "MRFUserModel.h"
#import "MRFImageView.h"
#import "MRFImageModel.h"

#import "MRFMacros.h"

@implementation MRFFriendsView

#pragma mark -
#pragma mark Accessors

- (void)setUserModel:(MRFUserModel *)userModel {
    MRFSynthesizeObservingSetter(userModel);
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(MRFUserModel *)model {
    self.userImageView.imageModel = [MRFImageModel imageModelWithURL:model.imageURL];
    self.userNameLabel.text = model.name;
    self.userEmailLabel.text = model.email;
}

#pragma mark -
#pragma mark MRFModelProtocol

- (void)modelDidLoad:(MRFUserModel *)model {
    [self fillWithModel:model];
    [self hideLoadingView];
}

@end
