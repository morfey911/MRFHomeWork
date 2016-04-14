//
//  MRFFillingCell.m
//  Final Project
//
//  Created by Yurii Mamurko on 11.11.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFFillingCell.h"

#import "MRFFilling.h"

#import "MRFConstants.h"

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
    self.volumeLabel.text = [[volume stringValue] stringByAppendingString:kMRFLiters];
    self.priceLabel.text = [NSString stringWithFormat:@"%@ %@/%@", [price stringValue], kMRFCurrency, kMRFLiters];
    self.mileageLabel.text = [[model.mileage stringValue] stringByAppendingString:kMRFKilometers];
    self.totalLabel.text = [NSString stringWithFormat:@"%.2f %@", [price floatValue] * [volume floatValue], kMRFCurrency];
}

- (NSString *)stringFromDate:(NSDate *)date {
    return [NSDateFormatter localizedStringFromDate:date
                                          dateStyle:NSDateFormatterShortStyle
                                          timeStyle:NSDateFormatterShortStyle];
}

@end
