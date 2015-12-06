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

#import "NSString+MRFExtensions.h"

@implementation MRFFillingCell

#pragma mark -
#pragma mark Accessors

- (void)setFillingModel:(MRFFilling *)model {
    [self fillWithModel:model];
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(MRFFilling *)model {
    NSNumber *price = model.price;
    NSNumber *volume = model.volume;
    
    self.dateLabel.text = [NSString stringFromDate:model.date];
    self.volumeLabel.text = [volume stringValue];
    self.priceLabel.text = [price stringValue];
    self.mileageLabel.text = [model.mileage stringValue];
    self.totalLabel.text = [NSString stringWithFormat:@"%.2f", [price floatValue] * [volume floatValue]];
}

- (NSString *)stringFromDate:(NSDate *)date {
    return [NSDateFormatter localizedStringFromDate:date
                                          dateStyle:NSDateFormatterShortStyle
                                          timeStyle:NSDateFormatterShortStyle];
}

@end
