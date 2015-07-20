//
//  NSString+MRFNStringExtensions.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 20.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "NSString+MRFNStringExtensions.h"

@implementation NSString (MRFNStringExtensions)

+ (instancetype)alhabetWithUnicodeRange:(NSRange)range {
    NSMutableString *string = [NSMutableString string];
    for (unichar character = range.location; character < NSMaxRange(range); character++) {
        [string appendFormat:@"%c", character];
    }
    
    return [self stringWithString:string];
}

+ (instancetype)randomStringWithLength:(uint32_t)length charString:(NSString *)string {
    NSMutableString *result = [NSMutableString stringWithCapacity:length];
    uint32_t stringLength = (uint32_t)[string length];
    
    for (uint32_t iterator = 0; iterator < length; iterator++) {
        unichar randomChar = [string characterAtIndex:arc4random_uniform(stringLength)];
        [result appendFormat:@"%c", randomChar];
    }
    
    return [self stringWithString:result];
}

@end
