//
//  MRFAlphabets.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 28.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFAlphabets.h"

@implementation MRFAlphabets

#pragma mark -
#pragma mark Class methods

+ (instancetype)uppercaseLetterAlphabet {
    NSRange range = NSMakeRange('A', ('Z' - 'A' + 1));
    return [self alphabetWithUnicodeRange:range];
}

+ (instancetype)lowercaseLetterAlphabet {
    NSRange range = NSMakeRange('a', ('z' - 'a' + 1));
    return [self alphabetWithUnicodeRange:range];
}

+ (instancetype)letterAlphabet {
    NSArray *alphabets = [NSArray arrayWithObjects:
                          [self uppercaseLetterAlphabet],
                          [self lowercaseLetterAlphabet],
                          nil];
    
    return [self alphabetWithAlphabets:alphabets];
}

+ (instancetype)numericAlphabet {
    NSRange range = NSMakeRange('0', 10);
    return [self alphabetWithUnicodeRange:range];
}

@end
