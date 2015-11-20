//
//  MRFFillingDetailCell.h
//  Final Project
//
//  Created by Yurii Mamurko on 20.11.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFTableViewCell.h"

@interface MRFFillingDetailCell : MRFTableViewCell
@property (nonatomic, strong)   IBOutlet    UILabel     *valueLabel;
@property (nonatomic, strong)   IBOutlet    UITextField *valueTextField;

@end
