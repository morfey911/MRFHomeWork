//
//  MRFFriendCell.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 28.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFFriendCell.h"

#import "MRFImageView.h"
#import "MRFImageModel.h"

#import "MRFUserModel.h"

@implementation MRFFriendCell

#pragma mark -
#pragma mark Accessors

- (void)setUserModel:(MRFUserModel *)userModel {
    if (_userModel != userModel) {
        [self fillWithModel:userModel];
    }
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(MRFUserModel *)model {
    self.friendNameLabel.text = model.name;
    self.friendImageView.imageModel = [MRFImageModel imageModelWithURL:model.imageURL];
}

@end
