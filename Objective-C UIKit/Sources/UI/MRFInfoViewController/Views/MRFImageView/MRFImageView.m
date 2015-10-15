//
//  MRFImageView.m
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 14.10.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFImageView.h"

#import "MRFImageModel.h"

#import "MRFMacros.h"

@implementation MRFImageView

#pragma mark -
#pragma mark Initializations and Dellocations

- (void)dealloc {
    self.imageModel = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setImageModel:(MRFImageModel *)imageModel {
    MRFSynthesizeObservingSetterAndLoad(imageModel);
    
    [self fillWithModel:imageModel];
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(MRFImageModel *)model {
    self.imageView.image = model.image;
}

#pragma mark -
#pragma mark MRFModel

- (void)modelWillLoad:(id)model {
    
}

- (void)modelDidFailLoading:(id)model {
    
}

- (void)modelDidLoad:(id)model {
    [self fillWithModel:model];
}

@end
