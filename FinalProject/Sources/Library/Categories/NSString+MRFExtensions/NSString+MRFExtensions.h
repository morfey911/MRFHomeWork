//
//  NSString+MRFExtensions.h
//  Final Project
//
//  Created by Yurii Mamurko on 06.12.15.
//  Copyright © 2015 Yurii Mamurko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MRFExtensions)

+ (NSString *)stringFromDate:(NSDate *)date;

+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)formatString;

@end
