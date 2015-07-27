//
//  NSString+MRFNStringExtensions.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 20.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "NSString+MRFNStringExtensions.h"

static const uint32_t defaultLength = 30;

@implementation NSString (MRFNStringExtensions)

+ (instancetype)stringWithAlphabet:(MRFAlphabet *)alphabet {
    NSMutableString *result = [NSMutableString string];
    
    for (NSUInteger i = 0; i < [alphabet.symbols count]; i++) {
        NSString *symbol = [alphabet.symbols objectAtIndex:i];
        [result appendString:symbol];
    }
    
    return [self stringWithString:result];
}


+ (instancetype)randomStringWithLength:(uint32_t)length alphabet:(MRFAlphabet *)alphabet {
    NSMutableString *result = [NSMutableString stringWithCapacity:length];
    NSArray *alphabetSymbols = [alphabet symbols];
    uint32_t alphabetCount = (uint32_t)[alphabet.symbols count];
    
    for (uint32_t iterator = 0; iterator < length; iterator++) {
        NSString *randomSymbol = [alphabetSymbols objectAtIndex:arc4random_uniform(alphabetCount)];
        [result appendFormat:@"%@", randomSymbol];
    }
    
    return [self stringWithString:result];
}

+ (instancetype)randomStringWithLength:(uint32_t)length {
    return [self randomStringWithLength:length alphabet:[MRFAlphabet uppercaseLetterAlphabet]];
}

+ (instancetype)randomString {
    return [self randomStringWithLength:defaultLength];
}

@end
