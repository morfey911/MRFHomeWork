//
//  MRFFillingDetailView.m
//  Final Project
//
//  Created by Yurii Mamurko on 21.11.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFFillingDetailView.h"

#import "MRFFilling.h"

@implementation MRFFillingDetailView

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
}

- (NSString *)currentDateString {
    return [NSDateFormatter localizedStringFromDate:[NSDate date]
                                          dateStyle:NSDateFormatterShortStyle
                                          timeStyle:NSDateFormatterShortStyle];
}

@end
