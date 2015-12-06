//
//  MRFFillingDetailView.h
//  Final Project
//
//  Created by Yurii Mamurko on 21.11.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MRFFilling;
@class MRFDateTextField;

@interface MRFFillingDetailView : UITableView <UITextFieldDelegate>
@property (nonatomic, strong)   IBOutlet    MRFDateTextField    *dateField;
@property (nonatomic, strong)   IBOutlet    UITextField         *mileageField;
@property (nonatomic, strong)   IBOutlet    UITextField         *volumeField;
@property (nonatomic, strong)   IBOutlet    UITextField         *priceField;
@property (nonatomic, strong)   IBOutlet    UITextField         *totalField;
@property (nonatomic, strong)   IBOutletCollection(UITextField)   NSSet     *textFieldsSet;
@property (nonatomic, strong)   MRFFilling  *model;
@property (nonatomic, strong)   MRFFilling  *placeholdersModel;

@end
