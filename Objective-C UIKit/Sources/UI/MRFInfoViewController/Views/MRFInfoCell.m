//
//  MRFInfoCell.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 18.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFInfoCell.h"

@implementation MRFInfoCell

#pragma mark -
#pragma mark Accessors

- (void)setInfo:(MRFInfoModel *)info {
    if (_info != info) {
        _info = info;
    }
    
    [self fillWithModel:info];
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(MRFInfoModel *)model {
    self.stringLabel.text = model.string;
    self.infoImageView.image = model.image;
}

@end
