//
//  MRFInfoCell.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 18.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFInfoCell.h"

#import "MRFInfoModel.h"

#import "MRFMacros.h"

@implementation MRFInfoCell

#pragma mark -
#pragma mark Accessors

- (void)setInfo:(MRFInfoModel *)info {
    MRFSynthesizeObservingSetterAndLoad(info)
    
    [self fillWithModel:info];
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(MRFInfoModel *)model {
    self.stringLabel.text = model.string;
    self.infoImageView.image = model.image;
}

#pragma mark -
#pragma mark MRFInfoModelProtocol

- (void)infoModelWillLoad:(MRFInfoModel *)model {
    [self.spinner startAnimating];
}

- (void)infoModelDidFailLoading:(MRFInfoModel *)model {
    
}

- (void)infoModelDidLoad:(MRFInfoModel *)model {
    [self fillWithModel:model];
    [self.spinner stopAnimating];
}

@end
