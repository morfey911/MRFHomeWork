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

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    for (UITextField *field in self.textFieldsSet) {
        field.delegate = self;
    }
}

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
    self.totalField.text = [self stringWithMultiplicationOfString:self.volumeField.text
                                                withAnotherString:self.priceField.text];
}

- (void)fillPlaceholdersWithModel:(MRFFilling *)model {
    self.dateField.date = [NSDate date];
    self.mileageField.placeholder = [model.mileage stringValue];
    self.priceField.placeholder = [model.price stringValue];
}

- (NSString *)stringWithMultiplicationOfString:(NSString *)string withAnotherString:(NSString *)anotherString {
    return [NSString stringWithFormat:@"%.2f", [string floatValue] * [anotherString floatValue]];
}

- (NSString *)stringWithDivisionOfString:(NSString *)string withAnotherNumber:(NSString *)anotherString {
    return [NSString stringWithFormat:@"%.2f", [string floatValue] / [anotherString floatValue]];
}

#pragma mark -
#pragma mark UITextFieldDelegate

- (BOOL)                textField:(UITextField *)textField
    shouldChangeCharactersInRange:(NSRange)range
                replacementString:(NSString *)string
{
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if (textField == self.volumeField) {
        self.totalField.text = [self stringWithMultiplicationOfString:newString
                                                    withAnotherString:self.priceField.text];
    }
    if (textField == self.priceField) {
        self.totalField.text = [self stringWithMultiplicationOfString:self.volumeField.text
                                                    withAnotherString:newString];
    }
    if (textField == self.totalField) {
        self.priceField.text = [self stringWithDivisionOfString:newString
                                              withAnotherNumber:self.volumeField.text];
    }
    
    return YES;
}

@end
