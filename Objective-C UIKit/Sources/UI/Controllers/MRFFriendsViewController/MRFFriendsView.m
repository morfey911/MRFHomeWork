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

@implementation MRFFriendsView

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(MRFUserModel *)model {
    self.userImageView.imageModel = [MRFImageModel imageModelWithURL:model.imageURL];
    self.userNameLabel.text = model.name;
    self.userEmailLabel.text = model.email;
}

@end
