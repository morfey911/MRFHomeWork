//
//  MRFFillingDetailView.m
//  Final Project
//
//  Created by Yurii Mamurko on 21.11.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFFillingDetailView.h"

#import "MRFFilling.h"

#import "MRFDateTextField.h"

@implementation MRFFillingDetailView

#pragma mark -
#pragma mark Accessors

- (void)setModel:(MRFFilling *)model {
    [self fillWithModel:model];
}

- (void)setPlaceholdersModel:(MRFFilling *)model {
    [self fillPlaceholdersWithModel:model];
}

#pragma mark -
#pragma mark Private

- (void)fillWithModel:(MRFFilling *)model {
    self.dateField.date = model.date;
    self.mileageField.text = [model.mileage stringValue];
    self.volumeField.text = [model.volume stringValue];
    self.priceField.text = [model.price stringValue];
    self.totalField.text = [NSString stringWithFormat:@"%.2f", [model.price floatValue] * [model.volume floatValue]];
}

- (void)fillPlaceholdersWithModel:(MRFFilling *)model {
    self.dateField.date = [NSDate date];
    self.mileageField.placeholder = [model.mileage stringValue];
    self.priceField.placeholder = [model.price stringValue];
    
    [self.mileageField becomeFirstResponder];
}

#pragma mark -
#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
}

- (BOOL)                textField:(UITextField *)textField
    shouldChangeCharactersInRange:(NSRange)range
                replacementString:(NSString *)string
{
    return YES;
}

@end
