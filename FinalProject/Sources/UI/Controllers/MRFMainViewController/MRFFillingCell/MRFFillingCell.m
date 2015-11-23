//
//  MRFFillingCell.m
//  Final Project
//
//  Created by Yurii Mamurko on 11.11.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFFillingCell.h"

#import "MRFFilling.h"

#import "MRFMacros.h"

@implementation MRFFillingCell

#pragma mark -
#pragma mark Accessors

- (void)setFillingModel:(MRFFilling *)model {
    [self fillWithModel:model];
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(MRFFilling *)model {
    self.dateLabel.text = [self stringFromDate:model.date];
    self.volumeLabel.text = [model.volume stringValue];
    self.priceLabel.text = [model.price stringValue];
    self.mileageLabel.text = [model.mileage stringValue];
}

- (NSString *)stringFromDate:(NSDate *)date {
    return [NSDateFormatter localizedStringFromDate:date
                                          dateStyle:NSDateFormatterShortStyle
                                          timeStyle:NSDateFormatterShortStyle];
}

@end
