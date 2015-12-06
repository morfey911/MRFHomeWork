//
//  NSString+MRFExtensions.m
//  Final Project
//
//  Created by Yurii Mamurko on 06.12.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import "NSString+MRFExtensions.h"

static NSString * const kMRFDateFormat = @"d MMM. y HH:mm";

@implementation NSString (MRFExtensions)

+ (NSString *)stringFromDate:(NSDate *)date {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.locale = [NSLocale currentLocale];
    formatter.dateFormat = kMRFDateFormat;
    
    return [formatter stringFromDate:date];
}

@end
