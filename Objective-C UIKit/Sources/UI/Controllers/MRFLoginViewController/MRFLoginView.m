//
//  MRFLoginView.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 24.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFLoginView.h"

#import "MRFUserModel.h"

#import "MRFMacros.h"

@implementation MRFLoginView

#pragma mark -
#pragma mark Accessors

- (void)setUserModel:(MRFUserModel *)userModel {
    MRFSynthesizeObservingSetter(userModel);
    
    [self fillWithModel:userModel];
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(MRFUserModel *)model {
    self.userID.text = model.userID;
}

#pragma mark -
#pragma mark MRFModelProtocol

- (void)modelDidLoad:(MRFUserModel *)model {
    self.userID.text = model.userID;
}

@end
