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

#pragma mark -
#pragma mark Private

- (void)fillWithModel:(MRFFilling *)model {
    self.dateLabel.text = [self currentDateString];
    self.mileageField.placeholder = [model.mileage stringValue];
    self.priceField.placeholder = [model.price stringValue];
    
    [self.mileageField becomeFirstResponder];
}

- (NSString *)currentDateString {
    return [NSDateFormatter localizedStringFromDate:self.date
                                          dateStyle:NSDateFormatterShortStyle
                                          timeStyle:NSDateFormatterShortStyle];
}

@end
