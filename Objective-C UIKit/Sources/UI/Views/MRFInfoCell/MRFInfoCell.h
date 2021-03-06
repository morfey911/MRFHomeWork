//
//  MRFInfoCell.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 18.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFTableViewCell.h"

#import "MRFModelProtocol.h"

@class MRFImageView;
@class MRFInfoModel;

@interface MRFInfoCell : MRFTableViewCell
@property (nonatomic, strong)   IBOutlet    MRFImageView            *infoImageView;
@property (nonatomic, strong)   IBOutlet    UILabel                 *stringLabel;

@property (nonatomic, strong)   MRFInfoModel    *info;

- (void)fillWithModel:(MRFInfoModel *)model;

@end
