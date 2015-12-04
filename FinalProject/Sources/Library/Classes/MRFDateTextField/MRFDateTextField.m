//
//  MRFDateTextField.m
//  Final Project
//
//  Created by Yurii Mamurko on 04.12.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFDateTextField.h"

static NSString * const kMRFDateFormat = @"d MMM. y HH:mm";

@implementation MRFDateTextField

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupDateFieldInputView];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupDateFieldInputView];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setDate:(NSDate *)date {
    if (_date != date) {
        _date = date;
        
        self.text = [self stringFromDate:date];
    }
}

#pragma mark -
#pragma mark Private

- (void)setupDateFieldInputView {
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self
                   action:@selector(datePickerValueChanged:)
         forControlEvents:UIControlEventValueChanged];
    
    self.inputView = datePicker;
}

- (void)datePickerValueChanged:(UIDatePicker *)sender {
    self.date = sender.date;
}

- (NSString *)stringFromDate:(NSDate *)date {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.locale = [NSLocale currentLocale];
    formatter.dateFormat = kMRFDateFormat;
    
    return [formatter stringFromDate:date];
}

@end
