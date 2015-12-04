//
//  MRFFillingDetailView.m
//  Final Project
//
//  Created by Yurii Mamurko on 21.11.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFFillingDetailView.h"

#import "MRFFilling.h"

@interface MRFFillingDetailView ()
@property (nonatomic, strong)   NSDate  *date;

@end

@implementation MRFFillingDetailView

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.date = [NSDate date];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setModel:(MRFFilling *)model {
    [self fillWithModel:model];
}

- (void)setPlaceholdersModel:(MRFFilling *)model {
    [self fillPlaceholdersWithModel:model];
}

- (void)setDate:(NSDate *)date {
    if (_date != date) {
        _date = date;
        self.dateField.text = [self stringFromDate:date];
    }
}

#pragma mark -
#pragma mark View lifecycle

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    [self setupDateFieldInputView];
}

#pragma mark -
#pragma mark Private

- (void)fillWithModel:(MRFFilling *)model {
    self.dateField.text = [self stringFromDate:model.date];
    self.mileageField.text = [model.mileage stringValue];
    self.volumeField.text = [model.volume stringValue];
    self.priceField.text = [model.price stringValue];
    self.totalField.text = [NSString stringWithFormat:@"%.2f", [model.price floatValue] * [model.volume floatValue]];
}

- (void)fillPlaceholdersWithModel:(MRFFilling *)model {
    self.dateField.text = [self currentDateString];
    self.mileageField.placeholder = [model.mileage stringValue];
    self.priceField.placeholder = [model.price stringValue];

    [self.mileageField becomeFirstResponder];
}

- (void)setupDateFieldInputView {
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self
                   action:@selector(datePickerValueChanged:)
         forControlEvents:UIControlEventValueChanged];
    
    self.dateField.inputView = datePicker;
}

- (void)datePickerValueChanged:(UIDatePicker *)sender {
    self.date = sender.date;
}

- (NSString *)currentDateString {
    return [self stringFromDate:[NSDate date]];
}

- (NSString *)stringFromDate:(NSDate *)date {
    return [NSDateFormatter localizedStringFromDate:date
                                          dateStyle:NSDateFormatterShortStyle
                                          timeStyle:NSDateFormatterNoStyle];
}

@end
