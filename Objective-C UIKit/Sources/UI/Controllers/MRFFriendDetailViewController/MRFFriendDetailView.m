//
//  MRFFriendDetailView.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 29.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFFriendDetailView.h"

#import "MRFUserModel.h"
#import "MRFImageView.h"
#import "MRFImageModel.h"

#import "MRFMacros.h"

@implementation MRFFriendDetailView

#pragma mark -
#pragma mark Accessors

- (void)setModel:(MRFUserModel *)model {
    MRFSynthesizeObservingSetter(model);
    
    [self fillWithModel:model];
}

#pragma mark -
#pragma mark Private

- (void)fillWithModel:(MRFUserModel *)model {
    self.userIDLabel.text = model.userID;
    self.nameLabel.text = model.name;
    self.emailLabel.text = model.email;
    self.friendImageView.imageModel = [MRFImageModel imageModelWithURL:model.imageURL];
}

@end
