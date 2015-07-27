//
//  MRFAlphabet.m
//  MRFHuman
//
//  Created by Yurii Mamurko on 22.07.15.
//  Copyright (c) 2015 Yurii Mamurko. All rights reserved.
//

#import "MRFAlphabet.h"
#import "MRFAlphabetWithRange.h"
#import "MRFAlphabetFromString.h"
#import "MRFAlphabetWithStrings.h"
#import "MRFAlphabetWithAlphabets.h"

@implementation MRFAlphabet

@dynamic symbols;

+ (instancetype)alphabetWithUnicodeRange:(NSRange)range {
    return [[[MRFAlphabetWithRange alloc] initWithUnicodeRange:range] autorelease];
}

+ (instancetype)alphabetWithString:(NSString *)string {
    return [[[MRFAlphabetFromString alloc] initWithString:string] autorelease];
}

+ (instancetype)alphabetWithStrings:(NSArray *)strings {
    return [[[MRFAlphabetWithStrings alloc] initWithStrings:strings] autorelease];
}

+ (instancetype)alphabetWithAlphabets:(NSArray *)alphabets {
    return [[[MRFAlphabetWithAlphabets alloc] initWithAlphabets:alphabets] autorelease];
}


+ (instancetype)uppercaseLetterAlphabet {
    NSRange range = {'A', ('Z' - 'A' + 1)};
    return [self alphabetWithUnicodeRange:range];
}

+ (instancetype)lowercaseLetterAlphabet {
    NSRange range = {'a', ('z' - 'a' + 1)};
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
    NSRange range = {'0', 10};
    return [self alphabetWithUnicodeRange:range];
}

@end
