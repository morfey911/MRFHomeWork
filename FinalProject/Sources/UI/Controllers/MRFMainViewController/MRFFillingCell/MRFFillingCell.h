//
//  MRFFillingCell.h
//  Final Project
//
//  Created by Yurii Mamurko on 11.11.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFTableViewCell.h"

@class MRFFilling;

@interface MRFFillingCell : MRFTableViewCell
@property (nonatomic, strong)   IBOutlet    UILabel *dateLabel;
@property (nonatomic, strong)   IBOutlet    UILabel *mileageLabel;
@property (nonatomic, strong)   IBOutlet    UILabel *volumeLabel;
@property (nonatomic, strong)   IBOutlet    UILabel *priceLabel;
@property (nonatomic, strong)   IBOutlet    UILabel *totalLabel;
@property (nonatomic, strong)   MRFFilling  *fillingModel;

- (void)fillWithModel:(MRFFilling *)model;

@end
