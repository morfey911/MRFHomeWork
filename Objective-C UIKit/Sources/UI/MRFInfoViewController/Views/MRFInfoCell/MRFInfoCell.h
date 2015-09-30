//
//  MRFInfoCell.h
//  Objective-C UIKit
//
//  Created by Yurii Mamurko on 18.09.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFTableViewCell.h"

#import "MRFInfoModelProtocol.h"

@class MRFInfoModel;

@interface MRFInfoCell : MRFTableViewCell <MRFInfoModelProtocol>
@property (nonatomic, strong)   IBOutlet    UIImageView             *infoImageView;
@property (nonatomic, strong)   IBOutlet    UILabel                 *stringLabel;
@property (nonatomic, strong)   IBOutlet    UIActivityIndicatorView *spinner;

@property (nonatomic, strong)   MRFInfoModel    *info;

- (void)fillWithModel:(MRFInfoModel *)model;

@end
