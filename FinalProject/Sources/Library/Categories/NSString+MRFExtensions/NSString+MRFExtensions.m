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
    return [self stringFromDate:date withFormat:kMRFDateFormat];
}

+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)formatString {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.locale = [NSLocale currentLocale];
    formatter.dateFormat = formatString;
    
    return [formatter stringFromDate:date];
}

@end
